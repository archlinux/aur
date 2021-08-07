# Maintainer: Heiko Nickerl <sodalite at hnicke dot de>
pkgname=sodalite
pkgver=0.21.37
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://sodalite.hnicke.de"
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
sha256sums=('ec29c8f0cd3424a3d8693c68e3b83cd431b12565187773936b1e158ea2eb5281')

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
