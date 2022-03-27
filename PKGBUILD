# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=adw-gtk-theme
pkgver=1.1
pkgrel=1
pkgdesc="LibAdwaita Theme for all GTK3 and GTK4 Apps"
arch=(any)
depends=(libadwaita adw-gtk3)
install=$pkgname.install
source=(extract-libadwaita-theme.{hook,sh} index.theme.{light,dark})
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
   local libalpmdir="$pkgdir"/usr/share/libalpm
   install -Dm644 {"$srcdir","$libalpmdir/hooks"}/extract-libadwaita-theme.hook
   install -Dm755 {"$srcdir","$libalpmdir/scripts"}/extract-libadwaita-theme.sh
   install -Dm644 "$srcdir"/index.theme.light "$pkgdir"/usr/share/themes/Adw/index.theme
   install -Dm644 "$srcdir"/index.theme.dark "$pkgdir"/usr/share/themes/Adw-dark/index.theme
}
