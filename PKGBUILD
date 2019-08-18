# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
_pkgbase=simple-shutdown-dialog
pkgname=simple-shutdown-dialog-git
pkgver=3.436e6bc
pkgrel=1
pkgdesc="A simple dialog to shutdown, reboot, suspend or logout, built with GTK"
arch=('x86_64' 'i686')
url="https://github.com/Maxr1998/SimpleShutdownDialog"
license=('GPL')
depends=('gtk3')
provides=('simple-shutdown-dialog')
source=("$_pkgbase::git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgbase"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgbase"
    make
}

package() {
    cd "$_pkgbase"
    install -Dm755 shutdown-dialog "$pkgdir"/usr/bin/shutdown-dialog
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
