# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20160522
pkgrel=1
pkgdesc='Automatically updates the pacman mirrorlist.'
arch=('any')
url='https://aur.archlinux.org/packages/update-pacman-mirrorlist/'
license=('custom:Public Domain')
depends=('curl')
optdepends=('systemd: timer for automatic mirrorlist updates')
backup=('etc/update-pacman-mirrorlist')
install=install
source=(install LICENSE update-pacman-mirrorlist{,.{1,config,service,timer}})
sha512sums=('b9325178e13249e1b2c56cd4a4135b535e0b9f547b8d1c1ef3c2ac81d00acf5b33cc5d37d6fe0cc48021f294bd7eb54745d208487de1a80facbd474706342efb'
            '57f083acfdb3b05be097f27d8df8afb77820c61ca138f097f22564d3e10dd0b713aaf02e421d6ab8223b6fb462ad16833ce08a0f10ed17a0d3a82f34b9494df0'
            'fdeb15221189b224094ea84856a931b4acf63949a648c2373bae7baaaa9fdee74021e7e8a26179c9b0e984170b7c4bee070d217b6de89ff504b9e55c12419169'
            '9b8cf26971bcbad20abcb8f1539b9790a707762a61774e3f0ce2969ebdbf7adeeebea7b49146fc0da59ae7949bc058cf56dd2e709ecdaa2498a01d5c4c329ccc'
            'cf2d28b08afe85e43510013697d1dfb74b56094c8050fce1802f3a80c66b7f7092068c13d849318783cef2f6a96712935014abd6bd783f19507028aec65b6299'
            'd4570b8b13dadf3116a3d6f4db1578bc036d6010f77ff3d0e3d0621d9304da6c3dde1398924d0ce308ce3fff894a27d4a8c8bc8f4ff0b7eca3938d95311a44e4'
            '1764c50a3fbf7ef1a408fbf2b1884c353cdc626724f7906c5022013bf3c5327e2a7ddc7f3608bbbe831fe865f1dd3cf8371fcae674ea7c877c847e8ed725944d')

package()
{
	cd "$srcdir"

	install -Dm755 update-pacman-mirrorlist "$pkgdir/usr/bin/update-pacman-mirrorlist"
	install -Dm644 update-pacman-mirrorlist.config "$pkgdir/etc/update-pacman-mirrorlist"

	install -Dm644 update-pacman-mirrorlist.service "$pkgdir/usr/lib/systemd/system/update-pacman-mirrorlist.service"
	install -Dm644 update-pacman-mirrorlist.timer "$pkgdir/usr/lib/systemd/system/update-pacman-mirrorlist.timer"

	install -Dm644 <(gzip -c update-pacman-mirrorlist.1) "$pkgdir/usr/share/man/man1/update-pacman-mirrorlist.1.gz"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
