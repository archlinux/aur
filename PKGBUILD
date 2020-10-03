# Maintainer: thegala <thegala at disroot.org>

_pkgname=kibot
pkgname=kibot-git
pkgver=701.75ae78a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="KiCad automation scripts."
url="https://github.com/INTI-CMNB/kibot"
license=('Apache2.0')
depends=( 'python' 'kibom' 'pcbdraw' 'kiauto' 'python-yaml')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/INTI-CMNB/kibot")
md5sums=('SKIP')
provides=('kibot')
conflicts=('kibot')

pkgver()
{
  cd "$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
