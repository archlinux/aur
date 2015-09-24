# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=3.71
pkgrel=4
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="https://github.com/ZivaVatra/flac2all"
license=('GPL2')
conflicts=('flac2all-svn')
depends=('flac' 'python2')
optdepends=('lame: for mp3 support'
'vorbis-tools: for ogg support'
'opus-tools: for opus support')

# graysky is temp hosting on his github until Ziva tags his releases
source=("https://github.com/graysky2/flac2all/archive/v$pkgver.tar.gz")
sha256sums=('2bae1c535dad613f659ea42e8c769f4bb9a89b940edfbeaee60e8561ffcf77e8')

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 stable/$pkgname.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 stable/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
