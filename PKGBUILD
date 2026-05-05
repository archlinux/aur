# Maintainer: CHONKY <r4mdhn2003@gmail.com>
pkgname=bbmp
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal TUI music player for MP3 and FLAC files"
arch=('any')
url="https://github.com/chonkyy/bbmp"
license=('MIT')
depends=(
    'python'
    'python-pygame'
    'python-mutagen'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cfaebe8d6f63cd5a04c3fcd7510607e3728ce6aec7bbadcc0638d8abd929491a')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
