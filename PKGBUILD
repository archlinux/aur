# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
commit=f61f72c212cea27f388eb4a26ede0d65035bdb53
pkgver=0.0.1.$(echo $commit | cut -c1-7)
pkgrel=2
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
source=(https://raw.githubusercontent.com/diafygi/acme-tiny/${commit}/acme_tiny.py)
sha256sums=('ab934479180dd4ebc95b36704d2f4118c0957f8b83b24af133be3e965c21e7af')

package() {
    cd "$srcdir"

    install -m 0755 -d "$pkgdir/usr/bin/"
    install -m 0755 acme_tiny.py "$pkgdir/usr/bin/acme-tiny"
}

