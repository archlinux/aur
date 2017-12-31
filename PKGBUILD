# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-stylishdark
pkgver=1.1
pkgrel=1
pkgdesc='stylishdark grub2 theme'
arch=(any)
url='https://www.gnome-look.org/p/1009237/'
license=('GPL')
depends=('grub')
optdepends=('grub-customizer')
install=${pkgname}.install

source=('https://dl.opendesktop.org/api/files/downloadfile/id/1513659780/s/dba9843ba21bfd0f5b3bee0fa0a5f86c/t/1514732419/grub-themes-stylishdark.tar.xz')

md5sums=('SKIP')

package() {
    mv $srcdir/${pkgname}_${pkgver}-${pkgrel}_all $srcdir/$pkgname
    rm -rf $srcdir/$pkgname/DEBIAN
    cp -rf $srcdir/$pkgname/boot $pkgdir/
    
    echo '======='
    echo -e 'You should:\n1. edit\e[36m /etc/default/grub \e[0m,add (or modify) the line \n \e[1m GRUB_THEME="/boot/grub/themes/StylishDark/theme.txt"\e[0m'
    echo -e '\e[0m \n2. execute \n \e[1m sudo grub-mkconfig -o /boot/grub/grub.cfg \e[0m after installation.\e[0m'
    echo '----------'
    echo -e 'also you can use a gui app -- \e[1m grub-customizer \e[0m for changing grub'
    echo '======='
}
