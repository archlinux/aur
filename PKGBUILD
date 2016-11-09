# Maintainer: parchd <parchd at archlinux.info>

pkgname=certbot-systemd
pkgver=0.1.1
pkgrel=1
pkgdesc='Systemd scripts for certbot (letsencrypt) renewals'
license=('GPL3')
source=("https://github.com/parchd-1/certbot-systemd/archive/v$pkgver.tar.gz")
sha512sums=('ab2d6bab90c4708a27a169deb41275466c60e3357bd11ecc584584f14669b3b550596a870fbe8c8b0742f99eeb44e6ad304fb243e077c560440bf2335bae1d51')
arch=('any')
depends=('certbot' 'systemd')
backup=('etc/certbot-users')

package() {
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot.service" "$pkgdir/usr/lib/systemd/system/certbot.service"
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot.timer" "$pkgdir/usr/lib/systemd/system/certbot.timer"
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot-users" "$pkgdir/etc/certbot-users"
}
