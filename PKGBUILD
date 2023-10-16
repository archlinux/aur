# Maintainer: thegala <thegala at disroot.org>

_pkgname=kiauto
pkgname=kiauto-git
pkgver=891.f489865
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="KiCad automation scripts."
url="https://github.com/INTI-CMNB/KiAuto"
license=('Apache2.0')
depends=( 'python' 'kicad' 'xdotool' 'xclip' 'libxslt' 'python-xvfbwrapper')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/INTI-CMNB/KiAuto")
md5sums=('SKIP')
provides=('kiauto')
conflicts=('kiauto')

pkgver()
{
  cd "$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
