# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=flac2all
pkgver=3.71
pkgrel=3
pkgdesc="Multi-threaded audio converter of FLAC to either Ogg Vorbis or MP3 retaining all tags and metadata."
arch=('any')
url="http://code.google.com/p/flac2all"
license=('GPL2')
conflicts=('flac2all-svn')
depends=('flac' 'python2')
optdepends=('lame: for mp3 support'
'vorbis-tools: for ogg support'
'opus-tools: for opus support')

# temp hosting until Ziva finds a permanent host
#source=(http://$pkgname.googlecode.com/files/"$pkgname"_v$pkgver.py
source=("flac2all_v$pkgver.py::http://flac2all.witheredfire.com/cgi-bin/download.cgi?download=flac2all_v$pkgver.py"
$pkgname.1)
sha256sums=('7b451635f2c680431b227fc07e356f58c2a709d88e2bfe9ff021b675d6b54f26'
            'a55806a227d5370681dc42d6f86fc7a3f3e7ae7e460bbc1a5f3065721b3f75bb')

package() {
	install -Dm755 flac2all_v$pkgver.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
