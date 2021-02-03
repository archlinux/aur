# Maintainer: Tilmann Meyer <allescrafterx@gmail.com>

pkgname=kernel-install-hook
pkgver=0.1.1
pkgrel=2
pkgdesc="kernel-install add/remove hook"
url=https://systemd.io/BOOT_LOADER_SPECIFICATION
arch=('any')
license=('MIT')
depends=('systemd')
source=(
  "kernel-install"
  "kernel-reconfigure"
  "90-kernel-install.hook"
  "90-kernel-remove.hook"
)
sha256sums=('aeae1c3c28c85e324886cbe123aa4815447502344401fe85173248cfdc014387'
            '48c2a937df113e44992663903912f39f7881cf0ad1f4ce6c8accb25a0d674688'
            '765817f0b58a4f5fab7a404f4cb07d0df32d7d092d18a36aa3f93968199113da'
            'd7c61213be16a540de05f942e9ad759f98aa2441d30db0c7e059fa1bd478685c')

package() {
  install -Dm644 "${srcdir}/90-kernel-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-kernel-install.hook"
  install -Dm644 "${srcdir}/90-kernel-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/90-kernel-remove.hook"
  install -Dm755 "${srcdir}/kernel-install"         "${pkgdir}/usr/share/libalpm/scripts/kernel-install"
  install -Dm755 "${srcdir}/kernel-reconfigure"     "${pkgdir}/usr/bin/kernel-reconfigure"
}
