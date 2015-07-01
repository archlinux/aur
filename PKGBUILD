pkgname=cen64-qt-git
pkgver=20150126
pkgrel=1
pkgdesc="A basic frontend for CEN64"
arch=('i686' 'x86_64')
url="https://github.com/dh4/cen64-qt"
license=('BSD')
depends=('qt5-base' 'quazip' 'cen64-git')
install=cen64-qt-git.install

_gitroot='https://github.com/dh4/cen64-qt.git'
_gitname='cen64-qt'

build() {
    cd "$srcdir"
    git clone "$_gitroot"
    cd "$_gitname"
    
    qmake-qt5
    make
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 "cen64-qt"                   "$pkgdir/usr/bin/cen64-qt"
    install -Dm644 "LICENSE"                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/cen64-qt.desktop" "$pkgdir/usr/share/applications/cen64-qt.desktop"
    install -Dm644 "resources/images/cen64.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cen64-qt.png"
}
