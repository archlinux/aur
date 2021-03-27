# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook-uefi-systemd
pkgver=0.5.0
pkgrel=2
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
sha256sums=('2315588a5e87f46d53e7566942547ea258a4e6f00a28de2f87603b3522172d1b'
            '85d5a588984c9c204064926bcdf61dcdbf8d2424efe91389e07669b08ab0ef75'
            '8b662d1cbcde160b96c8172c94d68f52c2df1718a280321bdbd0ba7e815d8cfe'
            '6907029a32d144669cb8d312a788598a43c1a45647c33fa66f2fdf165aea71f8')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
