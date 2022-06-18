# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=3.0
pkgrel=2
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv' 'ffmpeg' 'awk')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e8e11694ea46a085ef6f1b6520be186e44f2398cbd59e59858b1209be9c884c')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm755 "./players/player_download" "$pkgdir/usr/bin/players/player_download"
	install -Dm755 "./players/player_mpv" "$pkgdir/usr/bin/players/player_mpv"
	install -Dm755 "./players/player_syncplay" "$pkgdir/usr/bin/players/player_syncplay"
	install -Dm755 "./players/player_vlc" "$pkgdir/usr/bin/players/player_vlc"
	install -Dm755 "./UI" "$pkgdir/usr/bin/UI"
}
