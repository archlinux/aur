# Maintainer: ProfP303 prof.p@gmx.net
pkgname=youplaytx
pkgver=0.4.3
pkgrel=2
pkgdesc="A full-screen, dual-pane YouTube audio player for the terminal"
arch=('any')
url="https://codeberg.org/ProfP303/youplaytx"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'mpv'
    'python-mpv'
    'yt-dlp'
    'python-textual'
    'python-pyperclip'
    'python-platformdirs'
    'python-tomli-w'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f49517bcab4bbbd862f4b4cb1f39405a235d6a00c1c4ad42f9d34d57e99709f')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
