# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=shshare
pkgver=0.1.8
pkgrel=1
pkgdesc="A screenshotter, recorder, and uploader"
arch=('any')
url="https://github.com/MarkusGordathian/shshare"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'maim' 'xclip' 'jq' 'xsel')
optdepends=('libnotify: for notifying of upload completions'
			'ffmpeg: for screen recording')
source=("shshare-${pkgver}.tar.gz::https://github.com/MarkusGordathian/shshare/releases/download/${pkgver}/shshare-${pkgver}.tar.gz")
backup=(etc/share.sh.d/upload.sh)
sha512sums=('a3f006c6b05f219eec370fa7093404e83415a29bf09413e3deb1cea6bc55b5f2b1802a4f057f1cef060391c99c24b46d21acf3489e170db1c7f2389d9efd7bc0')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 shshare "${pkgdir}/usr/bin/shshare"
	install -D -m755 uploader.sh "${pkgdir}/etc/shshare/uploader.sh"
	install -D -m644 shshare.1.gz "${pkgdir}/usr/share/man/man1/shshare.1.gz"
}
