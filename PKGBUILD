pkgname=aspect
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal music player for YouTube"
arch=('any')
url="https://github.com/ohxa/aspect"
license=('MIT')
depends=(
    'python>=3.10'
    'python-textual>=0.61.1'
    'yt-dlp>=2026.4.10'
    'python-mpv>=1.0.8'
    'mpv'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("https://github.com/ohxa/aspect/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
