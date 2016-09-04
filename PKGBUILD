# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
commit=daba51d37efd7c1f205f9da383b9b09968e30d29
pkgver=0.0.1.$(echo $commit | cut -c1-7)
pkgrel=2
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
source=(https://raw.githubusercontent.com/diafygi/acme-tiny/${commit}/acme_tiny.py)
sha256sums=('bcd7cb56c280543c929cb4b7b2d1ed2d7ebabdae74fedc96b6a63f218c0b8ace')

package() {
    cd "$srcdir"

    install -m 0755 -d "$pkgdir/usr/bin/"
    install -m 0755 acme_tiny.py "$pkgdir/usr/bin/acme-tiny"
}

