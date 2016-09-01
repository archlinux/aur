# Maintainer: Pierre Marsais <pierre.marsais@lse.epita.fr>
pkgname=bitetorrent
pkgver=1.0
pkgrel=1
pkgdesc="A service seeding the torrent root filsystem for PXE boot"
arch=('any')
url="https://github.com/lse/bitetorrent/"
license=('None')
depends=('diskfile-git' 'enhanced-ctorrent' 'curl' 'util-linux' 'sed' 'grep')
provides=('bitetorrent')
source=("https://github.com/lse/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('c0f784562d984af07fac74fa5460f026')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 bitetorrent "$pkgdir/usr/bin/bitetorrent"
	install -Dm 644 bitetorrent.service "$pkgdir/usr/lib/systemd/system/bitetorrent.service"
}
