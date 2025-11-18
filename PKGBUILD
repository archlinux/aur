# Maintainer: sos-developers <aur@saveoursecrets.com>
pkgname=saveoursecrets-bin
pkgver=2.0.2+126
pkgrel=1
pkgdesc="Secure password manager and wallet"
arch=('x86_64')
url="https://saveoursecrets.com"
license=('custom')
depends=(
  'glibc'
  'libsecret'
  'jsoncpp'
  'dbus'
)
source=("https://releases.saveoursecrets.com/beta/gui/${pkgver}/arch/x86_64/saveoursecrets.tgz")
sha256sums=('126ae41975dc2567a6112b7445e4c01c03de69d5902edb8f15cae94f5993ed04')

package() {
  cd "$srcdir/saveoursecrets-${pkgver}"

  install -Dm755 saveoursecrets "$pkgdir/usr/opt/saveoursecrets/saveoursecrets"
  install -Dm755 sos-extension-helper "$pkgdir/usr/opt/saveoursecrets/sos-extension-helper"
  cp -r lib "$pkgdir/usr/opt/saveoursecrets/"
  cp -r data "$pkgdir/usr/opt/saveoursecrets/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/saveoursecrets"

  install -d "$pkgdir/usr/bin"
  ln -sr "$pkgdir/usr/opt/saveoursecrets/saveoursecrets" "$pkgdir/usr/bin/saveoursecrets"
  ln -sr "$pkgdir/usr/opt/saveoursecrets/sos-extension-helper" "$pkgdir/usr/bin/sos-extension-helper"
}
