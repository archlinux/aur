# Maintainer: thegala <thegala at disroot.org>

_pkgname=kibot
pkgname=kibot-git
pkgver=2986.1af4204d
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Helps you to generate the fabrication and documentation files for your KiCad projects."
url="https://github.com/INTI-CMNB/kibot"
license=('Apache2.0')
depends=( 'python' 'kibom' 'pcbdraw' 'kiauto' 'python-yaml')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/INTI-CMNB/kibot.git")
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
  python setup.py install --no-compile --root="$pkgdir"
}
