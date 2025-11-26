# Maintainer: sos-developers <aur@saveoursecrets.com>
pkgname=saveoursecrets-bin
pkgver=2.1.0+127
pkgrel=2
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
sha256sums=('7fcf6fadb0fbf1750bfd93317a6c20060b5f268112d4fb9b911258659bcfd3da')

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
