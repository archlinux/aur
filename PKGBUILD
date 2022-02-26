# Maintainer: Patrick Guenther <info at paddybu dot de>

pkgname=xontrib-hist-navigator
pkgver=0.6.4
pkgrel=1
pkgdesc="Fish-shell like prevd and nextd for xonsh with keyboard shortcuts"
url="https://github.com/jnoortheen/xontrib-hist-navigator"
arch=('any')
license=('MIT')
source=("https://github.com/jnoortheen/xontrib-hist-navigator/archive/refs/tags/v0.6.4.tar.gz")
depends=('python3' 'xonsh')
makedepends=('git' 'python-setuptools' 'python-poetry')
optdepends=()

sha256sums=('SKIP')
provides=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    poetry build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m pip install --root="$pkgdir/" --no-deps dist/${pkgname//-/_}-${pkgver}-py3-none-any.whl
}

