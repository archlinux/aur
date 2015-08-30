# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20150830
pkgrel=1
pkgdesc='Automatically updates the pacman mirrorlist.'
arch=('any')
url='https://aur.archlinux.org/packages/update-pacman-mirrorlist/'
license=('BSD')
depends=('curl' 'inotify-tools')
backup=('etc/update-pacman-mirrorlist')
install=install
source=(install LICENSE update-pacman-mirrorlist{,.{config,service,timer}})
sha512sums=('c2a4e59eb361ca119614f6ae34e073357f82b47cca3ee2a4bc3fc2bbc74953a006516f35765ae478bad2b9fb524295fe4e26c8cd660fad9723967b160c318c77'
            '74fe42bbc7c50c09d8694f8ba98c81932e27c2ea43d3d49add6a82e9f2e2f6b25c039a39f7c477d7012bdbcdcef03443249a06e6acec9ab9aafc5d72df3d8c07'
            'da9db1d0236b3bc5a1827cf7099e8f3ef52c4f7d4cdc18c4a1585bdefd88afea8cb1fc5a823af12585c9886198d9bb64285c121472e2615cd460fb9f889b45f4'
            'd91c9a5a41a8c35734d0bcaa3099e3860ff92a64cf14ef227e4b78df25933611162f5c6a28aa38ac7e032fb6f2af802b43ae6cbe4aa78616cbf2a91f06c464eb'
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
