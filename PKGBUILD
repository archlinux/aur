# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pypcap
pkgver=1.2.3.1
pkgrel=1
pkgdesc="Find the system include paths for clang and gcc based c/c++ compilers"
arch=('x86_64')
url="https://github.com/vpiserchia/pypcap"
license=('custom')
depends=('python' 'libpcap')
makedepends=('python-setuptools')
source=("https://github.com/vpiserchia/pypcap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b77b641c5bad8993d0d0b4f012cff0872ed235a036e9abf10e5eddf7c2362e8')

build() {
    cd "$srcdir/pypcap-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pypcap-$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et :
