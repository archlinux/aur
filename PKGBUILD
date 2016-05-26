# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=update-pacman-mirrorlist
pkgver=20160526
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
            'caa40910755735251e6dd5338e72f896798ea93e967b908399ed689a5d60de495c87226eed2a1cc121450967dcc369189a0313a6097b6a39b3150553356bfb32'
            '732d8b9fe3409557ce21779719cb2968ee9c920de1626e0ea9a07d08f57d37c5602085dc07121410b588d4ae6a4a036a718cb35cf086983af6345b020abfdd07'
            '9db4cef53320e9f2f2a6650c8702f57781a27a092e1d87497d6ab7d17fe82b785d928e1b2e6f5446bb40591389f84dcae13295ecc0ce10a0bbba652888535a79'
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
