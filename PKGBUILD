# Maintainer: parchd <parchd at archlinux.info>

pkgname=certbot-systemd
pkgver=0.1.0
pkgrel=1
pkgdesc='Systemd scripts for certbot (letsencrypt) renewals'
license=('GPL3')
source=("https://github.com/parchd-1/certbot-systemd/archive/v$pkgver.tar.gz")
sha512sums=('59887656f86c947a956f7634c620740f8bf724aa9ff47826e57c2ba18a1ea4274bed8db8acf5432e07d8bed04075418b44494776722ecb2c73a63762d6d1a2d6')
arch=('any')
depends=('certbot' 'systemd')
backup=('etc/certbot-users')

package() {
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot.service" "$pkgdir/usr/lib/systemd/system/certbot.service"
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot.timer" "$pkgdir/usr/lib/systemd/system/certbot.timer"
        install -Dm644 "$srcdir/$pkgname-$pkgver/certbot-users" "$pkgdir/etc/certbot-users"
}
