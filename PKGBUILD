# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20150627
pkgrel=2
pkgdesc='Automatically updates the pacman mirrorlist.'
arch=('any')
url='https://aur.archlinux.org/packages/update-pacman-mirrorlist/'
license=('BSD')
depends=('curl' 'inotify-tools')
install=install
source=(install LICENSE update-pacman-mirrorlist{,.{config,service,timer}})
sha512sums=('7b068344aa87628398b43b311436535d446012109e0b4c36a2342c29ab26f412ed7477c623cdec10ccbe10d88d634930fc9825a89dc3b63f2138b2ae3d78c3ab'
            '74fe42bbc7c50c09d8694f8ba98c81932e27c2ea43d3d49add6a82e9f2e2f6b25c039a39f7c477d7012bdbcdcef03443249a06e6acec9ab9aafc5d72df3d8c07'
            'f21bec6c8c89ae6b3b63a94573815403ee6d3b7f1003815784ddb2febbd3898e2dba5545a42cd8e972ff9faad59140b09a7148b6e2b610bf98d033db9aeedddd'
            '51f8d29fd8fcd3feff3ce6b131792722cbd1becfde89079725dfb1c542d8734ba7ce8bed944d7ec417e14ec404a73d50ef92b302a6ab1e1d98134c63019e258b'
            '587161f9e58732258c2d5d16fa2ccee4b57e3bfb56acf0cb060c1d9eeb048c1dcfea65bc7219a942174883e72beb62e85b25806ab0373cefd6ec49883db40b1c'
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
