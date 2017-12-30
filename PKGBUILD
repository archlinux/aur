# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=Pext
pkgname=pext-git
pkgver=0.11.1.r16.81d57a2
pkgrel=2
pkgdesc="Python-based extendable tool"
arch=('any')
url="https://pext.hackerchick.me/"
license=('GPL3')
depends=('python-dulwich' 'libnotify' 'python-pip' 'python-pyqt5' 'qt5-quickcontrols')
makedepends=('python-setuptools')
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support')
provides=('pext')
conflicts=('pext')
source=("git://github.com/Pext/Pext")
md5sums=("SKIP")

pkgver() {
  cd $appname
  echo "$(git describe | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  sed "s/'pyqt5'//g" -i $srcdir/$appname/setup.py
}

package() {
  cd "$srcdir/$appname"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
