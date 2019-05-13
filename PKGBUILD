# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=gnome-shell-extension-notification-center-git 
pkgver=r138.1f3ec46
pkgrel=4
pkgdesc="A GNOME Shell extension that eables notification center indicator on top panel and customizations."
arch=('any')
url="https://github.com/Selenium-H/Notification-Center"
license=('GPL3')
depends=('gnome-shell>=3.22' 'dconf')
makedepends=('git')
provides=("${pkgname/-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    install  -Dm644 schemas/*.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
    cp -R "notification-center@Selenium-H" "$pkgdir/usr/share/gnome-shell/extensions/"
}


