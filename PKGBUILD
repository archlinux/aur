# Maintainer: K Harishankar <hari2menon1234 at gmail dot com>

pkgname=grub-theme-bsol-git
pkgver=0+8.gc185560
pkgrel=1
pkgdesc="Grub2 blue-screen-of-life theme"
url=https://github.com/harishnkr/bsol
arch=('any')
license=('GPL-3.0-or-later')
depends=('sh')
makedepends=('git')
source=('git+https://github.com/harishnkr/bsol')
md5sums=('SKIP')
install=grub-bsol-theme.install

pkgver() {
    cd bsol
    echo "0+$(git rev-list --all | wc -l).g$(git rev-parse --short HEAD)"
}

package() {
    cd bsol
    install -v -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" \
        LICENSE
    cd bsol
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/bsol" \
        *.png
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/bsol" \
        *.pf2
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/bsol" \
        theme.txt
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/bsol/icons" \
        icons/*.png

}
