# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.4
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
sha512sums=('c23cf943152048c3a7ac7282bb7e4e0aba6e44def69cd7ba06e2ce426f874f2278049b13040e78881e1673d0fb0027d8b876fdf1e715d67f23008cdf953f0d5c')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/pacfetch"
}
