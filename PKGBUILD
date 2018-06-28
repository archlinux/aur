# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver=0.14.7
pkgrel=2
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-urwid' 'python-yaml' 
'python-pyperclip' 'python-pygments' 'python-watchdog')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnicke/sodalite/archive/v$pkgver.tar.gz")
backup=('etc/sodalite.conf')
sha256sums=('2969cbad6b9c31e735c7c65b9544c725f013ee14b9e2a9513424356359afc4e2')
install=sodalite.install

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
