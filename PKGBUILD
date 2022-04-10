# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/bashmultitool
pkgname=backupmenu
pkgver=2.2
pkgrel=3
pkgdesc="Backup program,TUI utility for Linux distro's , bash"
arch=('any')
url="https://github.com/gavinlyonsrepo/backupmenu"
license=('MIT')

source=("https://github.com/gavinlyonsrepo/backupmenu/archive/$pkgver.tar.gz")

sha256sums=('400e165613d4470a9ebc622f83786e6d539ac2adbc8fc9e7b9b31242c2cdd3bc')

package() {

    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 main/backupmenu "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"

    install -d  "$pkgdir"/usr/share/doc/backupmenu
    install -D -m644  documentation/* "$pkgdir"/usr/share/doc/backupmenu

    install -d  "$pkgdir"/usr/lib/backupmenu/modules
    install -D -m644  modules/* "$pkgdir"/usr/lib/backupmenu/modules
    
    install -D  -m644 desktop/backupmenu.desktop "$pkgdir/usr/share/applications/backupmenu.desktop"
    install -D  -m644 desktop/backupmenuicon.png "$pkgdir/usr/share/pixmaps/backupmenuicon.png"

}
