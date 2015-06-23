# Maintainer: Zeph <zeph33@gmail.com>

pkgname=prosody-mod-log-auth
pkgver=20131119
pkgrel=1
pkgdesc="Log failed authentication attempts with their IP address"
arch=('any')
url="https://code.google.com/p/prosody-modules/wiki/mod_log_auth"
install=$pkgname.install
license=('MIT')
depends=('prosody>=0.9')
optdepends=('fail2ban')
source=("prosody-auth.conf"
		"https://prosody-modules.googlecode.com/hg-history/e3a766045ef627eb32f374b782b8d0833c1c4168/mod_log_auth/mod_log_auth.lua")

md5sums=('a5093ddff04903dc2b6cf15ffd2ee41f'
         '817fdf9524f428285158b4a0bc9772f8')

package() {
  install -Dm 644 "$srcdir/mod_log_auth.lua" "$pkgdir/usr/lib/prosody/modules/mod_log_auth.lua"
  install -Dm 644 "$srcdir/prosody-auth.conf" "$pkgdir/etc/fail2ban/filter.d/prosody-auth.conf"
}

