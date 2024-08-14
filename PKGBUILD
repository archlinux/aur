# Maintainer(s): Derek Porcelli derekp5831@gmail.com

pkgname=lmp
pkgver=r15.c524d38
pkgrel=1
pkgdesc="A lightweight media player script"
arch=('x86_64')
url="https://github.com/derekporcelli/lmp"
license=('GPL')
depends=('python' 'mpv')
source=("git+https://github.com/derekporcelli/lmp.git")
sha256sums=('SKIP')
packager="Derek Porcelli derekp5831@gmail.com"

pkgver() {
    cd "$srcdir/lmp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/lmp"
    install -Dm755 lmp "$pkgdir/usr/bin/lmp"
    install -Dm644 lmp.conf "$pkgdir/etc/lmp/lmp.conf" 
}
