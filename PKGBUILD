# Maintainer: ProfP303 prof.p@gmx.net
pkgname=youplaytx
pkgver=0.5.4
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6e5d8e22707b5ee6b61ac1c41a9ba0121b9cb1903af1f69ee8a1b639b83e4e20')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
