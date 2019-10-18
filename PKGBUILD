# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=shshare
pkgver=0.1.10
pkgrel=2
pkgdesc="A screenshotter, recorder, and uploader"
arch=('any')
url="https://github.com/MarkusGordathian/shshare"
license=('GPL3')
validgpgkeys=('6F8F715D6CEAC6CCC49D996BA7E6852582706775')
depends=('curl' 'maim' 'xclip' 'jq' 'xsel')
optdepends=('libnotify: for notifying of upload completions'
			'ffmpeg: for screen recording')
source=("shshare-${pkgver}.tar.gz::https://github.com/MarkusGordathian/shshare/releases/download/${pkgver}/shshare-${pkgver}.tar.gz")
backup=("etc/shshare/uploader.sh")
sha512sums=('4ca9417a96942b0c8d96010335b24b105372d20001b6336476cf975664fcd2017cb3d2ff3b881b585f4acc91fa92b533ef15af6be9561dd07bcc5f8d0dba7602')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 shshare "${pkgdir}/usr/bin/shshare"
	install -D -m755 uploader.sh "${pkgdir}/etc/shshare/uploader.sh"
	install -D -m644 shshare.1.gz "${pkgdir}/usr/share/man/man1/shshare.1.gz"
	install -D -m644 shshare.bash "${pkgdir}/etc/bash_completion.d/shshare.bash"
}
