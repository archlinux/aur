# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="certbot-dns-google-domains"
pkgver=0.1.2
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
sha256sums=('1900aa3fb0335412b8101b0b7d4c483e2ca1a11985a824af59d346c23c0ddcb5')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
