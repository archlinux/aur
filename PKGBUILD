# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-msgraph-core
epoch=1
pkgver=0.2.2
pkgrel=1
pkgdesc='Core component of the Microsoft Graph Python SDK consisting of HTTP/Graph Client and a configurable middleware pipeline (Preview).'
arch=(any)
url=https://github.com/microsoftgraph/msgraph-sdk-python-core
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-requests' 'python-installer')
source=("https://pypi.io/packages/source/m/msgraph-core/msgraph-core-${pkgver}.tar.gz")
sha512sums=('14beb6f4b19033fd9027704ea68c37b65a296e7e346ecc8051e1aea0ac7f8f9012539a406fb9205455a2d1a5059ce8969de2edc56d04df3e95ad1284f166c3ab')

build() {
  cd msgraph-core-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd msgraph-core-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
