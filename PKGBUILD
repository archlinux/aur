# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Code Liger <codeliger@protonmail.com>
pkgname=video-compare
pkgver=20220920
pkgrel=1
epoch=
pkgdesc="Split screen video comparison tool using FFmpeg and SDL2 "
arch=('x86_64')
url="https://github.com/pixop/video-compare"
license=('GPL')
groups=()
depends=('ffmpeg' 'sdl2' 'sdl2_ttf')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/pixop/video-compare/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	curl -s https://api.github.com/repos/pixop/video-compare/releases/latest | jq -r '.tag_name'
}

package() {
	tar -C "$srcdir" -czf "$pkgdir/$pkgname" $pkgname
	install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname"
}
