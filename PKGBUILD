# Maintainer: Lukas Frühstück <aur@nullptr.at>

pkgname=mkinitcpio-tzpfms
pkgver=0.0.1 
pkgrel=1
pkgdesc="mkinitcpio hook to unlock encrypted ZFS filesystems using keys stored in TPM2 chips"
arch=('any')
url="https://github.com/fruel/mkinitcpio-tzpfms"
license=('BSD')
depends=('mkinitcpio-busybox' 'tzpfms')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
  '28a1cbef370c5d0ba8a6e46553a6c342f31c9d53fba3c4eeec578815eb476d84f67b45347e57d48afdec646d769b5c11b62e59f446f3facb19d4dc896d2472c3'
)

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tzpfms_hook"      "${pkgdir}/usr/lib/initcpio/hooks/tzpfms"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tzpfms_install"   "${pkgdir}/usr/lib/initcpio/install/tzpfms"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
