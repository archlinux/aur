# Maintainer: Heiko Nickerl <sodalite at hnicke dot de>
pkgname=sodalite
pkgver=0.21.43
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://sodalite.hnicke.de"
license=('GPL')
makedepends=('python-setuptools')
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
sha256sums=('48124c2f4b7cb022dfa37bdffa6c33cd0686277d0e60746d788c00d5cd26bcac')

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
