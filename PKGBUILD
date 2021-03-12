# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver="0.19.6"
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnicke/sodalite/archive/v$pkgver.tar.gz")
backup=('etc/sodalite.conf')
sha256sums=('f20151d12ab3f3520d999a173d358dd1d36dae145e8297fa77a5170fd3c86197')




_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
