# Maintainer: Rodrigo Lourenço <rzl@rzl.ooo>

pkgname=grub2-theme-fallout-git
pkgver=0+44.g211348f
pkgrel=1
pkgdesc="Fallout GRUB theme"
url=https://github.com/shvchk/fallout-grub-theme
arch=('any')
license=('MIT')
depends=()
makedepends=('git')
source=('git+https://github.com/shvchk/fallout-grub-theme')
md5sums=('SKIP')
install=grub-fallout-theme.install

pkgver() {
    cd fallout-grub-theme
    echo "0+$(git rev-list --all | wc -l).g$(git rev-parse --short HEAD)"
}

package() {
    cd fallout-grub-theme
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/fallout" \
        background.png \
        fixedsys-regular-32.pf2 \
        item_c.png \
        selected_item_c.png \
        terminal_box_c.png \
        theme.txt
    install -v -Dm644 -t "$pkgdir/usr/share/grub/themes/fallout" \
        icons/*.png
    install -v -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" \
        LICENSE
    install -v -Dm644 -t "$pkgdir/usr/share/doc/${pkgname}" \
        README.md
}
