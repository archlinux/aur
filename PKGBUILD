# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='SphinxExtensions'
pkgname=python-${_pkgname,,}
pkgver=0.2.0
pkgrel=1
pkgdesc="Extensions for the Sphinx documentation tool"
arch=(any)
url="https://github.com/Paebbels/SphinxExtensions"
license=('Apache')
depends=('python-pyattributes')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a0e92eaca61872ac09037609852378d4903b0df3373e845e7d1ef2540f3f2ea')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
