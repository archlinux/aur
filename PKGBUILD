# Maintainer: Mark Gross <mark.gross2001@gmail.com>

pkgname=shshare
pkgver=0.1.1
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
sha512sums=('ff34faa74a8388fcf556fc78a3fb1a8310768cb0f5d656f8d182fb76c48f7bbe04b642caaeb466a8ee316f16ae83e12e03408136601f0dbdd495d6712b35ec5b')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D -m755 shshare "${pkgdir}/usr/bin/shshare"
	install -D -m755 uploader.sh "${pkgdir}/etc/shshare/uploader.sh"
}
