# Maintainer: ProfP303 prof.p@gmx.net
pkgname=youplaytx
pkgver=0.5.3
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9aaa5d50861870a2152ec03fcdb1f6b58486d57b5bafd112b9dfedaea15d605b')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
