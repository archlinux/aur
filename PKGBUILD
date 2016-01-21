# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20160121
pkgrel=1
pkgdesc='Automatically updates the pacman mirrorlist.'
arch=('any')
url='https://aur.archlinux.org/packages/update-pacman-mirrorlist/'
license=('custom:Public Domain')
depends=('curl')
optdepends=('systemd: timer for automatic mirrorlist updates')
backup=('etc/update-pacman-mirrorlist')
install=install
source=(install LICENSE update-pacman-mirrorlist{,.{config,service,timer}})
sha512sums=('409104cf5b1157b5a69b139bd021eae3e0b5ead5b8dc7fb6228d5f3040e0f91caa8abd861c41cd83c22701fa57760a38559c041c3fba9110d6463cd47c3c83d1'
            '57f083acfdb3b05be097f27d8df8afb77820c61ca138f097f22564d3e10dd0b713aaf02e421d6ab8223b6fb462ad16833ce08a0f10ed17a0d3a82f34b9494df0'
            'a77dbca45fb7d22621984ac9f288e0fa63d90465c23fffedb740836b7267a489827d344d9f3de805f565cc2c01ebae54eee9d977df19a8ecb7d27c1c1a1533ca'
            'cf2d28b08afe85e43510013697d1dfb74b56094c8050fce1802f3a80c66b7f7092068c13d849318783cef2f6a96712935014abd6bd783f19507028aec65b6299'
            'e9c2b30d0c838adc3c3069677c86fa8cb22ac401067126ae44b131db4a78edb2d550c02d8490e3bded4d7111a4e72d5fd096a8e98eb54a831f89ef283bc291fc'
            'b18e8ef8992a73758cdc084b04321a9ba15917e2ccf42730d1685f9115f32131ff46dc2c088088632b3824bab464f16b9e4255603f16412b1d3ce9bfb7f35e06')
package()
{
	cd "$srcdir"

	install -Dm755 update-pacman-mirrorlist "$pkgdir/usr/bin/update-pacman-mirrorlist"
	install -Dm644 update-pacman-mirrorlist.config "$pkgdir/etc/update-pacman-mirrorlist"

	install -Dm644 update-pacman-mirrorlist.service "$pkgdir/usr/lib/systemd/system/update-pacman-mirrorlist.service"
	install -Dm644 update-pacman-mirrorlist.timer "$pkgdir/usr/lib/systemd/system/update-pacman-mirrorlist.timer"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
