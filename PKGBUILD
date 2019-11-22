# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)

source=(
  'https://gitlab.com/repomaa/autopass.cr//uploads/55777c26fe18b3c36bb3b493fb6db020/autopass'
  'https://gitlab.com/repomaa/autopass.cr//uploads/0f2c6aeeb707791ef6e780e98364109b/autopass.sig'
  "https://gitlab.com/repomaa/autopass.cr/raw/v${pkgver}/LICENSE"
  'autopass.service'
  'autopass.socket'
)
md5sums=(
  5628eb81a4f7816dabc274321c8e5b2c
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
