# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook-uefi
pkgver=9
pkgrel=2
pkgdesc="Install/remove hooks for dracut unified kernel images for systemd-boot"
url=https://codeberg.org/flausch/pkgbuilds/src/branch/main/dracut-hook-uefi
arch=('any')
license=('APACHE')
depends=('dracut')
noextract=()
conflicts=(dracut-hook)
source=(
  "dracut-uefi"
  "90-dracut-install.hook"
  "91-dracut-remove.hook"
)
sha256sums=('bf2aa48f993dabf5e524264f178081f8d06d400ae2dfaa723e8b58125ac36224'
            '0942d3ae411b953a1555c5e2226c1198658ff66556b126824b0ccd65b50ea256'
            '1daaad5f60d89c5198419db7e8a8d7599e9a4e252907437a1dc8f65f2ccd61b8')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/91-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/91-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi"
}
