# Maintainer: Heiko Nickerl <dev at hnicke dot de>
pkgname=sodalite
pkgver=0.21.34
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
depends=(
    'python>=3.9'
    'python-binaryornot'
    'python-urwid'
    'python-yaml'
    'python-pyperclip'
    'python-pygments'
    'python-watchdog'
    'python-click'
    'python-blinker'
    'xdg-utils'
)
source=("https://github.com/hnicke/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a4fecfa330e60f8ecb057105eb8b011bfa074883b8060c2c150fd9dd11c4a6ba')

_srcdir=$pkgname-$pkgver
build() {
    cd $_srcdir
    python setup.py build
}


package() {
    cd $_srcdir
    python setup.py install \
    --root="$pkgdir" \
    --prefix="/usr" \
    --optimize=1 \
    --skip-build

    make install-misc root="$pkgdir"
} 
