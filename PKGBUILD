# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20160108
pkgrel=1
pkgdesc='Automatically updates the pacman mirrorlist.'
arch=('any')
url='https://aur.archlinux.org/packages/update-pacman-mirrorlist/'
license=('BSD')
depends=('curl')
backup=('etc/update-pacman-mirrorlist')
install=install
source=(install LICENSE update-pacman-mirrorlist{,.{config,service,timer}})
sha512sums=('c2a4e59eb361ca119614f6ae34e073357f82b47cca3ee2a4bc3fc2bbc74953a006516f35765ae478bad2b9fb524295fe4e26c8cd660fad9723967b160c318c77'
            '74fe42bbc7c50c09d8694f8ba98c81932e27c2ea43d3d49add6a82e9f2e2f6b25c039a39f7c477d7012bdbcdcef03443249a06e6acec9ab9aafc5d72df3d8c07'
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
