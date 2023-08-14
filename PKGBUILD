# Original: Runnytu < runnytu at gmail.com >
# Maintainer: Zowie < me at zowie.cx >

pkgname=grub-backup-hook
pkgver=2.1
pkgrel=1
pkgdesc="Pacman hook to update GRUB after a kernel update (also makes grub.conf backups)"
arch=('any')
url="https://wiki.archlinux.org/index.php/Pacman#Hooks"
license=('GPL')
depends=('grub' 'bash')
conflicts=('grub-hook')
source=(grub.hook grub-hook.sh)
sha512sums=('bab685252a653eb89e7ec5e8b3d89fee73917782f6e16e4e590726288d3fdff9797b23ac1d9577d3dbfe69ba28ed5c192a862901a362bb6608265269475c0fff'
            'b2afb503d1e0b552e36a2ef3780b69386efd30732693f9f06e6e7d75cbcf965440654a72bb15fc1dc0daff1959e2060493aef6ea1af9040d69951eeaea0e41ed')

package() {
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/usr/share/libalpm/hooks/grub.hook"

  install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
  install -m755 "${srcdir}/grub-hook.sh" "${pkgdir}/usr/share/libalpm/scripts/grub-hook.sh"
}

