# Maintainer: Crescent Scroll <crescent-scroll@users.noreply.github.com>

pkgname=auri
pkgver=0.2.0_alpha
pkgrel=1
pkgdesc='A way to set up static Arch Linux machines'

arch=(any)
url="https://github.com/crescent-scroll/$pkgname"
license=(GPL3)

makedepends=(git)
source=("$pkgname::git+$url.git#tag=${pkgver//_/-}")
md5sums=(SKIP)
install="$pkgname.install"

package() {
    cd "$pkgname"
    
    install -d -m 755 "$pkgdir/usr/lib/initcpio/"{hooks,install}
    
    install -m 644 \
        "$srcdir/$pkgname/hook/setup.sh" \
        "$pkgdir/usr/lib/initcpio/install/$pkgname"
    
    install -m 644 \
        "$srcdir/$pkgname/hook/script.sh" \
        "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
}
