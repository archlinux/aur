# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase="python-free-tls-certificates-git"
pkgname=("python-free-tls-certificates-git" "python2-free-tls-certificates-git")
pkgver=r34.35e080f
pkgrel=1
pkgdesc="A simple Python client library for ACME server that issues TLS (aka SSL) certificates"
url="https://github.com/mail-in-a-box/free_tls_certificates"
arch=('any')
license=('CC0')
source=("git+https://github.com/mail-in-a-box/free_tls_certificates.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/free_tls_certificates"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-free-tls-certificates-git() {
    depends=("python-acme")
    cd "$srcdir/free_tls_certificates"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-free-tls-certificates-git() {
    depends=("python2-acme")
    cd "$srcdir/free_tls_certificates"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
