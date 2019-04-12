# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=gnome-shell-extension-gtktitlebar-git
pkgver=r3.dce6fe6
pkgrel=1
pkgdesc="A GNOME Shell extension that GTK Title Bar - Remove Title Bar for non-GTK Software"
arch=('any')
url="https://github.com/velitasali/GTKTitleBar"
license=('GPL2')
depends=('gnome-shell>=3.28')
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
    cp -R "gtktitlebar@velitasali.github.io" "$pkgdir/usr/share/gnome-shell/extensions"
}
