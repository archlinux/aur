# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook
pkgver=0.4.2
pkgrel=1
pkgdesc="Install/remove hooks for dracut"
url=https://dracut.wiki.kernel.org/index.php/Main_Page
arch=('any')
license=('BSD')
depends=('dracut')
noextract=()
source=(
  "dracut-install"
  "dracut-remove"
  "90-dracut-install.hook"
  "60-dracut-remove.hook"
)
sha256sums=('80db80ce535ab03041c4db168d85ffd68fcda20eedc88d2b27070bcf4265f4c5'
            '7b237dc4443f71c3785635a86e81eca951bbbc637f22146c0f958c094bad03a8'
            '492d51df1234b75a32e7dff63c86ee104a7d844a408070e1c4da5dc8ab53be6f'
            '054dac9f1d55029a922ff05c3064e54d25790c7a18d2b598edc58ef3d295cba1')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
