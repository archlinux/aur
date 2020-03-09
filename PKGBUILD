# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.4.5
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
sha512sums=('9d7690fbe2974205463da161cf845f401d06d0e9f476006610fb8d3b344ff29e8f0efb1e0882b1965bed07b762fcd197f4ebc35eb69bf3be8e34002037573f92')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/pacfetch"
}
