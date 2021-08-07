# Maintainer: Heiko Nickerl <sodalite at hnicke dot de>
pkgname=sodalite
pkgver=0.21.35
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
sha256sums=('e5cd2dba775383faa5fb4659039ff13a17ec9b0f1e566e57cb1efdc43ef50d65')

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
