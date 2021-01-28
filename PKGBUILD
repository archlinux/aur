# Maintainer: daerich <daerich.users.sourceforge.net>
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook-no-microcode
pkgver=0.4.2
pkgrel=1
pkgdesc="Install/remove hooks for dracut - no microcode convenience package"
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
sha256sums=('1b193a8946ed80039766958db3c05b1c4e1e387de2aa0ac5701879840076f7cb'
            '25409770cdf9607eb05addcbc0f89f45a91385c25b8a307425d4b3f4b7c2a9ef'
            '492d51df1234b75a32e7dff63c86ee104a7d844a408070e1c4da5dc8ab53be6f'
            '054dac9f1d55029a922ff05c3064e54d25790c7a18d2b598edc58ef3d295cba1')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
