# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgbase=python-pyrtlsdr-git
_pkgbase=pyrtlsdr
pkgname=(python-pyrtlsdr-git python2-pyrtlsdr-git)
pkgver=r111.e1e4ccf
pkgrel=1
pkgdesc="A Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
arch=('any')
url="https://github.com/roger-/pyrtlsdr"
license=('GPL3')
makedepends=('git' 'python' 'python2')
source=('git+https://github.com/roger-/pyrtlsdr.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-pyrtlsdr-git() {
    depends=('python' 'rtl-sdr')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    cd "$srcdir/${_pkgbase}"
    python setup.py install --root=$pkgdir
}

package_python2-pyrtlsdr-git() {
    depends=('python2' 'rtl-sdr')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    cd "$srcdir/${_pkgbase}"
    python2 setup.py install --root=$pkgdir
}
