# Original: Runnytu < runnytu at gmail.com >
# Maintainer: Zowie < me at zowie.cx >

pkgname=grub-hook
pkgver=2.1
pkgrel=1
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/Pacman#Hooks"
license=('GPL')
depends=('grub' 'bash')
source=(grub.hook grub-hook.sh)
sha512sums=('bab685252a653eb89e7ec5e8b3d89fee73917782f6e16e4e590726288d3fdff9797b23ac1d9577d3dbfe69ba28ed5c192a862901a362bb6608265269475c0fff'
            '23483aa7da89dddc4387988bae9d14e0a8dc463c5a48b9cfccc9d4481af71ce09483524fa3b27aaf023fe5de0771f183db201233e5575f3251968d755a05c274')

package() {
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/usr/share/libalpm/hooks/grub.hook"

  install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
  install -m755 "${srcdir}/grub-hook.sh" "${pkgdir}/usr/share/libalpm/scripts/grub-hook.sh"
}

