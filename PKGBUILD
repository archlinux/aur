# Maintainer: ProfP303 prof.p@gmx.net
pkgname=youplaytx
pkgver=0.5.2
pkgrel=1
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
sha256sums=('bc877b1e1e5ac86403544cdcbe7773ad7f20325cf45832f3a0bc358b1d6bd73c')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
