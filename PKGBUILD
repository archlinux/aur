# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)

source=(
  'https://gitlab.com/repomaa/autopass.cr//uploads/168f5db1cc7434c5c82a6e7fd9d7b217/autopass'
  'https://gitlab.com/repomaa/autopass.cr//uploads/b95bc647537b2c669f5de6f8bb666f9f/autopass.sig'
  "https://gitlab.com/repomaa/autopass.cr/raw/v${pkgver}/LICENSE"
  'autopass.service'
  'autopass.socket'
)
md5sums=(
  6197eeea3b6812f4b23a1424666dce17
  SKIP
  SKIP
  SKIP
  SKIP
)
validpgpkeys=(CC7BD43A315EBC373F9A1F2EEFEB16CB1C8952C5)
provides=('autopass')
conflicts=('autopass' 'autopass.cr' 'autopass.cr-git')
optdepends=('passed-git: batch editing of pass entries with sed')

package() {
  install -Dm755 autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 autopass.socket "$pkgdir/usr/lib/systemd/user/autopass.socket"
  install -Dm644 autopass.service "$pkgdir/usr/lib/systemd/user/autopass.service"
}

# vim:set ts=2 sw=2 et:
