# Maintainer: Stefan Welte <archlinux [at] stefan-welte . d [e]>
# Contributor: truecrypt-hook <jim945 [at] mail . r [u]>
pkgname=veracrypt-hook
pkgver=5.1
pkgrel=2
pkgdesc="Extensive hook for operations on a veracrypt encrypted root (or e.g. home) device"
arch=(any)
url="https://veracrypt.codeplex.com/"
license=('GPL')
depends=(mkinitcpio veracrypt)
install=${pkgname}.install
source=(veracrypt_hook veracrypt_install)
sha512sums=('e25717d2d413a1274f5784ffc65f2966411b4402e493c03f7ce48cd68aaf3f04b99ff9a28547b05058d83096e785b4608a7626e0b99ee0dd6a227b9bfa51ae1c'
            '22c513b19c7b3170497f54799487b61b34180db1c2d45edef3ef744a551e219685d838bf191be47f7503e7e7e8b9a6ee77f4fe3d5eb74105e943387605af10cb')

package() {
    install -o root -g root -D ${srcdir}/veracrypt_hook ${pkgdir}/usr/lib/initcpio/hooks/veracrypt
    install -o root -g root -D ${srcdir}/veracrypt_install ${pkgdir}/usr/lib/initcpio/install/veracrypt
}

