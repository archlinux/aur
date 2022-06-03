# Maintainer: Heiko Nickerl <sodalite at hnicke dot de>
pkgname=sodalite
pkgver=0.21.41
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
sha256sums=('c76ace0566ef4794c37db6edb63bb2f2a954931cb4bbd3126c9e13cce6b8458b')

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
