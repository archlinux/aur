# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.2.1
pkgrel=1
pkgdesc="Plugin for certbot to obtain certificates using a DNS TXT record for Porkbun domains"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/certbot_dns_porkbun"
depends=("certbot"
         "python-pkb-client"
         "python-requests"
         "python-tldextract")
makedepends=("python-setuptools")
source=("https://github.com/infinityofspace/certbot_dns_porkbun/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4700da18252e554d6b8266c3e5ab69fe19c39d897aa68fbec9b087f89e45e32')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python setup.py build
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
