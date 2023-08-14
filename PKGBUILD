# Maintainer: Zowie < git at zowie.cx >

pkgname=grub-theme-hook
pkgver=1.0
pkgrel=1
pkgdesc="Pacman hook to sync themes from /usr/share/grub/themes to /boot/grub/themes"
arch=('any')
url="https://wiki.archlinux.org/index.php/Pacman#Hooks"
license=('GPL')
depends=('grub' 'bash' 'rsync' 'coreutils')
source=(grub-theme.hook grub-theme-hook.sh)
sha512sums=('697b31943017925c81c420c6f1c526df78cc03be81d37c7885e315f2345528148c7107b21ef47b838c06ff3a5e2e48f3cd9be2e4d9646b4cb69143c99a65aee7'
            'd01aef26aea0c870728732e4b3b61449819b08b59b7270709816210b9eb519b208a12e0cb0ef4dc53617c7b2da39e8650f7852afcac772c7aea9c71110b2a49c')

package() {
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/grub-theme.hook" "${pkgdir}/usr/share/libalpm/hooks/grub-theme.hook"

  install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
  install -m755 "${srcdir}/grub-theme-hook.sh" "${pkgdir}/usr/share/libalpm/scripts/grub-theme-hook.sh"
}

