# Maintainer: ProfP303 prof.p@gmx.net
pkgname=youplaytx
pkgver=0.5.2
pkgrel=4
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
sha256sums=('24d0b877fdde5e183102a3a65f3b9fe364aaf04ecf65c4a96fdd2079a05b1523')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
