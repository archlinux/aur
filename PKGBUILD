# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="certbot-dns-google-domains"
pkgver=0.1.6
pkgrel=1
pkgdesc="A Certbot DNS Authenticator for Google Domains"
arch=("any")
license=("APACHE")
url="https://github.com/aaomidi/certbot-dns-google-domains"
depends=("certbot>=1.23.0"
         "python-zope-interface>=5.5.0"
         "python-dataclasses-json"
         )
makedepends=("python-build" "python-installer" "python-poetry-core" "python-wheel")
source=("https://github.com/aaomidi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d9a60ff0c783aac0ebddb3fadea0efb312775b971f6649eac4e238c3ee759fc')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
