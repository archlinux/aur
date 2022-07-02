# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook-uefi
pkgver=8
pkgrel=1
pkgdesc="Install/remove hooks for dracut unified kernel images for systemd-boot"
url=https://dracut.wiki.kernel.org/index.php/Main_Page
arch=('any')
license=('BSD')
depends=('dracut')
noextract=()
conflicts=(dracut-hook)
source=(
  "dracut-install"
  "dracut-remove"
  "90-dracut-install.hook"
  "60-dracut-remove.hook"
)
sha256sums=('6052fb0aff6543f9bf7749d47c8ac8ccb6a55cb6fb158ea97c841e4aee66447b'
            '19c8f01de54e0e29fe5e2bf53542bb3744a4b785ab615ed69f9277e67ae0cfeb'
            '18778db39cd46c6efc7f8fb3b7d6a5007d53bd5dbb78f76b71de5074fe067c4e'
            '6907029a32d144669cb8d312a788598a43c1a45647c33fa66f2fdf165aea71f8')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
