# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=shshare
pkgver=0.1.10
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
backup=("etc/shshare/uploader.sh")
sha512sums=('bb3ea2fcd510ffb3cbb835a919e841f5954aaee195c9594ae871b6cba7c11e386f0a79199f7cc07bb756364b0a2e4e98abf7f5d19dd53f7c64a3159760f386b0')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 shshare "${pkgdir}/usr/bin/shshare"
	install -D -m755 uploader.sh "${pkgdir}/etc/shshare/uploader.sh"
	install -D -m644 shshare.1.gz "${pkgdir}/usr/share/man/man1/shshare.1.gz"
	install -D -m644 shshare.bash "${pkgdir}/etc/bash_completion.d/shshare.bash"
}
