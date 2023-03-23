# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="certbot-dns-google-domains"
pkgver=0.1.8
pkgrel=1
pkgdesc="A Certbot DNS Authenticator for Google Domains"
arch=("any")
license=("APACHE")
url="https://github.com/aaomidi/certbot-dns-google-domains"
depends=("certbot>=1.23.0"
         "python-zope-interface>=5.5.0"
         "python-dataclasses-json>=0.5.7"
         "python-dataclasses-json<0.6.0"
         "python-publicsuffixlist>=0.9.3"
         "python-publicsuffixlist<1.0.0"
         )
makedepends=("python-build" "python-installer" "python-poetry-core" "python-wheel")
source=("https://github.com/aaomidi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e6fd2362c07756a5849fb9f4dd1cd2dc2c78ae90b78af97986856417c1fa252')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
