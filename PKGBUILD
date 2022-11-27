# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=aaxtomp3
pkgver=1.3
pkgrel=2
pkgdesc="Convert Audible's .aax filetype to MP3, FLAC, M4A, or OPUS"
arch=('any')
url='https://github.com/KrumpetPirate/AAXtoMP3'
license=('custom:WTFPL')
depends=('bash' 'ffmpeg' 'lame')
optdepends=(
	'jq: only if --use-audible-cli-data is set or converting an .aaxc file'
	'mediainfo: adds additional media tags')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7165c405660cf20b36d50ecad76c669d9daae16b5391755d3338a029b0346eb8')

package() {
	cd "AAXtoMP3-$pkgver"
	install -Dv AAXtoMP3 interactiveAAXtoMP3 -t "$pkgdir/usr/bin/"
	install -Dvm644 _config.yml -t "$pkgdir/usr/share/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
