# Contributor: Masami Ichikawae <masami256@gmail.com>
pkgname=slabbed-or-not
pkgver=0.2
pkgrel=1
epoch=1
pkgdesc="Detect if your container/VPS is running under a specific hypervisor."
arch=('i686' 'x86_64')
url="https://github.com/kaniini/slabbed-or-not"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=('git://github.com/kaniini/slabbed-or-not.git#tag=0.2')
md5sums=('SKIP') # skip git source checksum


build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m 755 -o root -g root "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 -o root -g root "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
}
