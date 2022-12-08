# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.6
pkgrel=1
pkgdesc="Plugin for certbot to obtain certificates using a DNS TXT record for Porkbun domains"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/certbot_dns_porkbun"
depends=("certbot>=1.18.0"
         "python-pkb-client"
         "python-requests"
         "python-tldextract")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://github.com/infinityofspace/certbot_dns_porkbun/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00c0449f1012085d250d4d7af998511b1408c27f23879dea278c0bfccbcc4faa')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
