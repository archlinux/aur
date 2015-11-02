# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=2.73
pkgrel=1
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
source=("https://github.com/ZivaVatra/flac2all/archive/v$pkgver.tar.gz")
sha256sums=('11a44717e9dad781e27434c4182a28d1a3c9a6f661bfad4d9168457370797286')

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 stable/$pkgname.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 stable/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
