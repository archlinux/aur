# Maintainer: Mark Huo <markhuomian at gmail dot com>
pkgname=python-bitbucket-api
_pkgname=BitBucket-api
pkgver=0.5.0
pkgrel=1
pkgdesc="Python library to interact with BitBucket REST API"
arch=('any')
url="https://github.com/Sheeprider/BitBucket-api"
license=('ISC')
depends=('python-requests' 'python-sh' 'python-requests-oauthlib')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b6ccabde3ae7739dc9fd16218288ac6691680a0f9a97bfd6d2463b68c5058e7c')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
