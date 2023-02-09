# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="certbot-dns-porkbun"
pkgver=0.7
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
sha256sums=('3454939c79fb937e3e23891ae5ec606d732edf6d468ad9433985ec6d0138d90b')

build(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "certbot_dns_porkbun-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
