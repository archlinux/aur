# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=shshare
pkgver=0.1.9
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
sha512sums=('77d77a2b78f182dec360a18fe58a00a832813856b65e03382953aa68f009f4d41fb87689acb97b8096874ef0b6d82d8c65ddaa91dfce452b893f462b18fb210c')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 shshare "${pkgdir}/usr/bin/shshare"
	install -D -m755 uploader.sh "${pkgdir}/etc/shshare/uploader.sh"
	install -D -m644 shshare.1.gz "${pkgdir}/usr/share/man/man1/shshare.1.gz"
}
