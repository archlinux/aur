# Maintainer: Jenya Sovetkin <e.sovetkin@gmail.com>
# Maintainer: Adam Bambuch <adam.bambuch2@gmail.com>
# Contributors: https://aur.archlinux.org/account/f4bio
pkgname=mkinitcpio-openswap
pkgver=0.1.1
pkgrel=1
pkgdesc="mkinitcpio hook to open swap at boot time"
arch=(any)
license=('unknown')
url="https://aur.archlinux.org/packages/mkinitcpio-openswap/"
depends=(mkinitcpio)
backup=('etc/openswap.conf')
install="usage.install"
source=('openswap.hook'
        'openswap.install'
        'openswap.conf')
sha256sums=('9e836a588098f2811e651e60dae98096aa59db8a402bc9cb94c42000a5052e3a'
            '2d60c98d4bd54134a5a4543848ecc7bce598e6faa7bd96a2df0a4767f6e9f3dd'
            '71516c53543d7deca0fa25efcbf91ca0df869ec0a9fac1ec94e587b18e064c16')

package() {  
  install -Dm 644 openswap.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/openswap"
  install -Dm 644 openswap.install \
     "${pkgdir}/usr/lib/initcpio/install/openswap"
  install -Dm 644 openswap.conf \
     "${pkgdir}/etc/openswap.conf"
}
