# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=3.2
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv' 'ffmpeg' 'awk')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('601476b32fb1a263b59b797fda0586fda277abf9410eb5d3ab21110766c35360')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./bin/ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm755 "./lib/ani-cli/player_download" "$pkgdir/usr/lib/ani-cli/player_download"
	install -Dm755 "./lib/ani-cli/player_mpv" "$pkgdir/usr/lib/ani-cli/player_mpv"
	install -Dm755 "./lib/ani-cli/player_syncplay" "$pkgdir/usr/lib/ani-cli/player_syncplay"
	install -Dm755 "./lib/ani-cli/player_vlc" "$pkgdir/usr/lib/ani-cli/player_vlc"
	install -Dm755 "./lib/ani-cli/UI" "$pkgdir/usr/lib/ani-cli/UI"
}
