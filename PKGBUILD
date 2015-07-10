# Maintainer: anekos <anekos@snca.net>

_pkgname=arturo
pkgname=${_pkgname}-git
pkgver=20150622
pkgrel=1
pkgdesc="Command line toolkit for working with Arduino hardware."
arch=('any')
url="https://github.com/scottdarch/Arturo"
license=('MIT')
depends=('arduino' 'python2-glob2-git' 'picocom' 'python2-jinja' 'python2-configobj' 'python2-pyserial')
makedepends=('python2' 'git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=('git+https://github.com/scottdarch/Arturo.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/Arturo
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd ${srcdir}/Arturo

  python2 setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/licenses/arturo"
  cp MIT-LICENSE.txt "$pkgdir/usr/share/licenses/arturo/LICENSE"
  # ln -s /usr/share/arduino/hardware/arduino/avr /usr/local/share/arduino/hardware/arduino
}

