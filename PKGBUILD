# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook
pkgver=0.4.1
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
sha256sums=('5110714a574eb14e1bace89a6526fc07d98a82969c1b4cb95c46aa183a750ab8'
            '25409770cdf9607eb05addcbc0f89f45a91385c25b8a307425d4b3f4b7c2a9ef'
            '439c5caa6e4487faa7238869fe08ceedbd9297208f1fe5286cb816364533a4ea'
            '054dac9f1d55029a922ff05c3064e54d25790c7a18d2b598edc58ef3d295cba1')

package() {
  install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
  install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
