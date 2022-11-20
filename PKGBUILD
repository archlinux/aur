# Maintainer: Evangelos Foutras <evangelos@foutrelis.com

pkgname=python38-stevedore
pkgver=4.1.1
pkgrel=1
pkgdesc="Manage dynamic plugins for Python applications"
arch=('any')
url="https://github.com/openstack/stevedore"
license=('Apache')
depends=('python38')
makedepends=('python38-pbr')
options=('!emptydirs')
source=(https://pypi.org/packages/source/s/stevedore/stevedore-$pkgver.tar.gz)
sha256sums=('7f8aeb6e3f90f96832c301bff21a7eb5eefbe894c88c506483d355565d88cc1a')

prepare() {
  cd stevedore-$pkgver
  # Remove dependency on pbr; it's not a runtime dependency
  sed -i '/pbr/d' requirements.txt
}

package() {
  cd stevedore-$pkgver
  python3.8 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
