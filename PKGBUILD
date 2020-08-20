pkgname=python-free-tls-certificates-git
pkgver=r34.35e080f
pkgrel=1
pkgdesc="A simple Python client library for ACME server that issues TLS (aka SSL) certificates"
url="https://github.com/mail-in-a-box/free_tls_certificates"
arch=('any')
license=('CC0')
depends=("python-acme")
source=("git+https://github.com/mail-in-a-box/free_tls_certificates.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/free_tls_certificates"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/free_tls_certificates"
    python setup.py install --root="$pkgdir" --optimize=1
}
