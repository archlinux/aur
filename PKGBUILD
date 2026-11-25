# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=5.2
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'ffmpeg' 'fzf')
optdepends=('vlc: An alternative video player' 'ani-skip: For skipping anime intros' 'curl-impersonate: To bypass Cloudflare protection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af2e3102d661d2eab0606f98f3b30c9e1a63d8e38adcaf5de6d3c0b191c9bd91')
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

