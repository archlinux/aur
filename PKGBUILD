# Maintainer: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
commit=4ed13950c0a9cf61f1ca81ff1874cde1cf48ab32
pkgver=0.0.1.2.$(echo $commit | cut -c1-7)
pkgrel=1
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
script_name="acme_tiny_${commit}.py"
source=(${script_name}::https://raw.githubusercontent.com/diafygi/acme-tiny/${commit}/acme_tiny.py)
sha256sums=('53fa7f0782324c2451efde0220e599789289ce9e14c778d1c32da27c3ddc9283')

package() {
    cd "$srcdir"

    install -m 0755 -d "$pkgdir/usr/bin/"
    install -m 0755 "$script_name" "$pkgdir/usr/bin/acme-tiny"
}

