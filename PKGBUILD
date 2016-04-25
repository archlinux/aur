# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=2.75
pkgrel=1
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
conflicts=('flac2all-svn')
depends=('flac' 'python2' 'opus-tools')
optdepends=('lame: for mp3 support'
'vorbis-tools: for ogg support')
#'opus-tools: for opus support')

source=("https://github.com/ZivaVatra/flac2all/archive/v$pkgver.tar.gz")
sha256sums=('9cfe80e2544b5c486b3468833e2034e4e6fa68c5a7a3f9a5c4e2f733c28d74aa')

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 stable/$pkgname.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 stable/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
