# Contributor: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="certbot-dns-google-domains"
pkgver=0.1.11
pkgrel=2
pkgdesc="A Certbot DNS Authenticator for Google Domains"
arch=("any")
license=("APACHE")
url="https://github.com/aaomidi/certbot-dns-google-domains"
depends=("certbot"
         "python-zope-interface"
         "python-dataclasses-json"
         "python-publicsuffixlist"
         )
makedepends=("python-build" "python-installer" "python-poetry-core" "python-wheel")
source=("https://github.com/aaomidi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('971ee263fc463b637fcf06c68c3559abd37f2b47efd48feb57af70552fbb1368')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
