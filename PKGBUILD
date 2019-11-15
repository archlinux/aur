# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)

source=(
  'https://gitlab.com/repomaa/autopass.cr/uploads/a953c14bdfa7206ad5e9fe1e8b8d30eb/autopass'
  'https://gitlab.com/repomaa/autopass.cr/uploads/d686f12a4e15988d424a03e5efb85a8d/autopass.sig'
  "https://gitlab.com/repomaa/autopass.cr/raw/v${pkgver}/LICENSE"
  'autopass.service'
  'autopass.socket'
)
md5sums=(
  30c8edd39c0798f60b6eb8831632bef2
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
