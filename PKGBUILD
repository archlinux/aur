#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tunner by hand

pkgname='python-tinycss2-1.4'
_module='tinycss2'
_src_folder='tinycss2-1.4.0'
pkgver='1.4.0'
pkgrel=1
pkgdesc="A tiny CSS parser"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('python-tinycss2')
provides=("python-tinycss2")
license=('custom:BSD License')
arch=('any')
source=("https://github.com/Kozea/tinycss2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8f0ea1b2bf55ceb5db60a5b4d7c151b584aade43353d2a44e8e55459ea735f4')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
