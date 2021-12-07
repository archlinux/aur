# Maintainer: Charles Vejnar

pkgname=python-pyfnutils
pkgver=1.3
pkgrel=1
pkgdesc="Small utility functions for Python: logging, parallel tasks, zstd."
arch=("any")
url="https://github.com/vejnar/pyfnutils"
license=("MPLv2")
depends=("python")
makedepends=("python-setuptools" "python-pip" "python-wheel")
source=("https://github.com/vejnar/pyfnutils/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("055825e6dbeebde50e955535c22a7af973ea4d41")

package() {
    cd "$srcdir/pyfnutils-$pkgver"
    pip install --disable-pip-version-check \
                --ignore-installed \
                --isolated \
                --no-deps \
                --no-build-isolation \
                --no-index \
                --no-cache-dir \
                --no-warn-script-location \
                --root="$pkgdir" \
                .
    cd "${pkgdir}"
    python -O -m compileall "usr/lib"
}
