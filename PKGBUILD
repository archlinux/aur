# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=split2flac
pkgver=122
pkgrel=1
pkgdesc="Split flac/ape/wv/wav + cue sheet into separate tracks."
arch=('any')
url="https://github.com/ftrvxmtrx/split2flac"
license=('MIT')
depends=('cuetools' 'shntool' 'flac')
conflicts=('split2flac-git')
optdepends=('aacgain-cvs:      to adjust gain in m4a'
'enca:         to automatically detect charset if not UTF8'
'faac:         to split into m4a'
'flac:         for flac replay gain support'
'mac:          to split APE format'
'id3lib:       to set tags in mp3 (unicode not supported)'
'imagemagick:  to convert/resize album cover images'
'lame:         to split into mp3'
'mutagen:      to split into mp3'
'libmp4v2:     to split into m4a'
'mp3gain:      mp3 volume normalization'
'mutagen:      to set tags in mp3 (with unicode support)'
'vorbis-tools: to split into ogg vorbis'
'vorbisgain:   ogg vorbis volume normalization'
'wavpack:      to split WV')
source=("https://github.com/ftrvxmtrx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('96dd53c92935ae6cb1650bf92f989658d7909b691bbec12b639736f79f5b639c')

package () {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 $pkgname-bash-completion.sh \
		"$pkgdir/usr/share/bash-completion/completions/$pkgname-bash-completion.sh"

	for i in split2mp3 split2ogg split2m4a split2wav; do
		ln -s split2flac "$pkgdir/usr/bin/$i"
	done
}
