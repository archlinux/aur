# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=5.0
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'ffmpeg' 'fzf')
optdepends=('vlc: An alternative video player' 'ani-skip: For skipping anime intros' 'curl-impersonate: To bypass Cloudflare protection')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4703d2f563eee27ea16d92f8e77e3f8a1f07ba8b2433598c3a1ce642841c35c')
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

