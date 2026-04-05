# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/backupmenu
pkgname=backupmenu
pkgver=2.4.0
pkgrel=1
pkgdesc="Backup program, TUI utility for Linux distro's, bash"
depends=('bashmultitool')
arch=('any')
url="https://github.com/gavinlyonsrepo/backupmenu"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/backupmenu/archive/$pkgver.tar.gz")

sha256sums=('c6a4bd658a78b40fbfc763a2ad2b1e882dbf11f8b32434a0a7d08aec90799aee')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 main/backupmenu "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"

    install -d  "$pkgdir"/usr/share/doc/backupmenu
    install -D -m644  documentation/*.md "$pkgdir"/usr/share/doc/backupmenu

    install -d  "$pkgdir"/usr/lib/backupmenu/modules
    install -D -m644  modules/* "$pkgdir"/usr/lib/backupmenu/modules
    
    install -D  -m644 desktop/backupmenu.desktop "$pkgdir/usr/share/applications/backupmenu.desktop"
    install -D  -m644 desktop/backupmenuicon.png "$pkgdir/usr/share/pixmaps/backupmenuicon.png"

}
