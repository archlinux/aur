# Maintainer: Charles Vejnar

pkgname=python-fontools
pkgver=0.3
pkgrel=1
pkgdesc="FONtools: The Feature Object Notation tools"
arch=("any")
url="https://github.com/vejnar/fontools"
license=("MPLv2")
depends=("python" "python-pyfnutils" "python-pyfaidx")
makedepends=("python-setuptools" "python-pip" "python-wheel")
source=("https://github.com/vejnar/fontools/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("966b0888d7a50369f9f04b907f6d480a5ede7a72")

package() {
    cd "$srcdir/fontools-$pkgver"
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
