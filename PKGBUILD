pkgname=wayvibes-gtk
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayvibes clone with GTK"
arch=('x86_64')
url="https://github.com/AurexDev/wayvibes-gtk"
license=('MIT')
depends=('gtk3' 'libevdev')
makedepends=('cmake' 'gcc' 'make' 'pkgconf' 'gtk3' 'libevdev' 'git')
source=("git+https://github.com/AurexDev/wayvibes-gtk.git")
md5sums=('SKIP')  # git sources

build() {
    cd "$srcdir/$pkgname"
    bash build.sh
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 build/wayvibes-gui "$pkgdir/usr/bin/wayvibes-gui"
    install -Dm755 build/wayvibes-gui "$pkgdir/usr/bin/wayvibes-gtk"
}
