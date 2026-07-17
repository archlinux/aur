# Maintainer: Iliarezaei <iliarezaei69@gmail.com>
pkgname=ilinote
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern note-taking app with graph view, tags, and internal links"
arch=('x86_64')
url="https://github.com/iliarezaei/ilinote"
license=('GPLv3')
depends=('qt5-base')
makedepends=('qt5-tools' 'gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iliarezaei/ilinote/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    qmake ilinote.pro
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ilinote "$pkgdir/usr/bin/ilinote"
    install -Dm644 ilinote.desktop "$pkgdir/usr/share/applications/ilinote.desktop" 2>/dev/null || true
    install -Dm644 ilinote.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ilinote.svg" 2>/dev/null || true
}
