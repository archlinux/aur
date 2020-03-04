# Maintainer: jmattheis <contact AT jmattheis DOT de>
pkgname=gruvbox-dark-gtk
pkgver=1.0.1
pkgrel=1
pkgdesc='A gruvbox dark theme. Supports GTK 2.0 and 3.0.'
arch=('any')
url="https://github.com/jmattheis/gruvbox-dark-gtk"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmattheis/gruvbox-dark-gtk/archive/v$pkgver.tar.gz")
sha256sums=('5164f43ff4c547601770c09f7d68f1191b069613af802786bb0b73c4d9b9e347')

package() {
    mkdir -p "$pkgdir/usr/share/themes/$pkgname"
    cd "$srcdir/$pkgname-$pkgver"
    cp -r "gtk-2.0" \
          "gtk-3.0" \
          "assets" \
          "gtk-3.20" \
          "index.theme" \
          "$pkgdir/usr/share/themes/$pkgname"
    chown -R root:root "$pkgdir/usr/share/themes"
    chmod -R ugo+rX "$pkgdir/usr/share/themes"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

