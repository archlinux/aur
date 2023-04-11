# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.8
pkgrel=1
pkgdesc="Plugin for certbot to obtain certificates using a DNS TXT record for Porkbun domains"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/certbot_dns_porkbun"
depends=("certbot>=1.18.0"
         "python-dnspython"
         "python-pkb-client"
         "python-requests")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/infinityofspace/certbot_dns_porkbun/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6859fe7afec606e8303c4fcd4fc52570eeaf5a4b143f57a773220f18a51d297')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
