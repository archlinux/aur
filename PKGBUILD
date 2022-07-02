# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook-uefi
pkgver=9
pkgrel=1
pkgdesc="Install/remove hooks for dracut unified kernel images for systemd-boot"
url=https://dracut.wiki.kernel.org/index.php/Main_Page
arch=('any')
license=('BSD')
depends=('dracut')
noextract=()
conflicts=(dracut-hook)
source=(
  "dracut-uefi"
  "90-dracut-install.hook"
  "91-dracut-remove.hook"
)
sha256sums=('ec9ad8edbf04a4fc3c3e128d43f976e42791314123347193455497f322e3c647'
            '0942d3ae411b953a1555c5e2226c1198658ff66556b126824b0ccd65b50ea256'
            '1daaad5f60d89c5198419db7e8a8d7599e9a4e252907437a1dc8f65f2ccd61b8')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/91-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/91-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-uefi"         "${pkgdir}/usr/share/libalpm/scripts/dracut-uefi"
}
