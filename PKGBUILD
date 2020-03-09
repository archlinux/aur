# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.4.1
pkgrel=1
pkgdesc="Simple fetch script for pacman based distros"
arch=(x86_64)
url="https://git.auteiy.me/dmitry/pacFetch"
license=(MIT)
depends=(
    coreutils
    findutils
    gawk
    pacman
    pacman-contrib
    procps-ng
    psmisc
    util-linux
)

optdepends=(
    'yay: for counting AUR updates'
    'wmctrl: for displaying window manager in Xorg'
)

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/raw/v$pkgver/pacfetch
)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('8522e4117fc3c70f04ae350394ea1cfec98cef0c0a0e6846b84dc091e7967388b4503f70bff3e78968f0eb4fa476844a370e33960b0094b67307543cdab18b98')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/pacfetch"
}
