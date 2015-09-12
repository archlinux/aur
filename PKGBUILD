# Maintainer: Csaba Henk
# Contributor: Csaba Henk 
pkgname='mkinitcpio-loop-subdir'
pkgver=0.0.1
pkgrel=1
pkgdesc='mkinitcpio hooks that allow booting from Arch installed in a file image or subdir'
url='https://github.com/csabahenk/mkinitcpio'
arch=('any')
license=('GPL')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'ntfs-3g')
source=('loop_hook' 'loop_install' 'subdir_hook' 'subdir_install' 'auxmount_hook' 'auxmount_install')
md5sums=('dd6f84a6d13caa0b5167915d2217c1a2'
         '2cfd0525999e452b0362d1091bf99157'
         '59b2424f231bfa3e577f55240dd92fdf'
         '634c1bccc59f34972642eb86c615a336'
         '6ca46ac8d394a4048c3330baddd0eccb'
         '9c0cdb5f0600ae446ece556d5d648170')

package() {
    install -Dm644 ${srcdir}/loop_install ${pkgdir}/usr/lib/initcpio/install/loop
    install -Dm644 ${srcdir}/loop_hook    ${pkgdir}/usr/lib/initcpio/hooks/loop
    install -Dm644 ${srcdir}/subdir_install ${pkgdir}/usr/lib/initcpio/install/subdir
    install -Dm644 ${srcdir}/subdir_hook    ${pkgdir}/usr/lib/initcpio/hooks/subdir
    install -Dm644 ${srcdir}/auxmount_install ${pkgdir}/usr/lib/initcpio/install/auxmount
    install -Dm644 ${srcdir}/auxmount_hook    ${pkgdir}/usr/lib/initcpio/hooks/auxmount
}
