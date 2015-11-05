pkgname=denix-grub2-theme
pkgver=1.0
pkgrel=1
pkgdesc="DeniX grub2 theme"
arch=("any")
url="https://github.com/denix666/denix-grub2-theme"
license=('GPLv3')
depends=('grub')
source=("git+https://github.com/denix666/denix-grub2-theme.git")
md5sums=('SKIP')

build() {
    msg '==============================================================='
    msg 'To enable theme, add to /etc/default/grub:'
    msg 'GRUB_THEME="/usr/share/grub/themes/denix/theme.txt"'
    msg ''
    msg 'Renew grub config as root: grub-mkconfig -o /boot/grub/grub.cfg'
    msg '==============================================================='
}

package() {
    cd ${srcdir}/${pkgname}
    install -dm755 ${pkgdir}/usr/share/grub/themes/denix
    install -D -m644 usr/share/grub/themes/denix/* ${pkgdir}/usr/share/grub/themes/denix
}
