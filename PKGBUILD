# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
commit=7ef9164dc141f369f5f92a1132b3ef9e12e95b73
pkgver=0.0.1.1.$(echo $commit | cut -c1-7)
pkgrel=1
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
source=(https://raw.githubusercontent.com/diafygi/acme-tiny/${commit}/acme_tiny.py)
sha256sums=('1abae6ea2045dd2490b8671c98e24bc82706df125fd171ce82b76d89c2bf3f46')

package() {
    cd "$srcdir"

    install -m 0755 -d "$pkgdir/usr/bin/"
    install -m 0755 acme_tiny.py "$pkgdir/usr/bin/acme-tiny"
}

