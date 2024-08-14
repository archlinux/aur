# Maintainer: Derek Porcelli <derekp5831@gmail.com>

pkgname=lmp
pkgver=r18.a485009
pkgrel=1
pkgdesc="A lightweight media player script"
arch=('x86_64')
url="https://github.com/derekporcelli/lmp"
license=('GPL')
depends=('python' 'mpv')
source=("https://github.com/derekporcelli/lmp/raw/arch/${pkgname}-${pkgver}-${arch}.pkg.tar.zst")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 lmp.py "$pkgdir/usr/bin/lmp"
    install -Dm644 lmp.conf "$pkgdir/etc/lmp/lmp.conf" 
}
