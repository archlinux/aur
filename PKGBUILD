# Maintainer: thegala <thegala at disroot.org>

_pkgname=kibom
pkgname=kibom-git
pkgver=572.51244bb
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Configurable BoM generation tool for KiCad EDA"
url="https://github.com/INTI-CMNB/kibom"
license=('Apache2.0')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/INTI-CMNB/KiBom")
md5sums=('SKIP')
provides=('kibom')
conflicts=('kibom')

pkgver()
{
  cd "$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
