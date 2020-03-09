# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=pacfetch
pkgver=1.0.4.3
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
sha512sums=('cf903795d9d8f1a635b11b442997706606275e9870bee47375e8975b54c1193bb92153490a8839466a9e77427e32c354fa44d6cfae941cc5463aee3795918ed8')

package() {

	# Creating needed directories
	install -Dm755 $srcdir/$pkgname-$pkgver-$pkgrel "$pkgdir/usr/bin/pacfetch"
}
