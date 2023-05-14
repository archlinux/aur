# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-delete-tweets
_pkgname=delete-tweets
pkgver=2.0.1
pkgrel=2
pkgdesc="a simple script that helps you delete tweets (or just replies or retweets) from your timeline"
url="https://github.com/koenrh/delete-tweets"
arch=('any')
license=('custom:isc')
depends=('python' 'python-twitter3' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/koenrh/delete-tweets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf19eae62899ce4573136d5c59a26e4b600bdf03129766b826255f5b1ec2e382')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
