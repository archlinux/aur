#!/hint/bash -e
# Maintainer: Adrien Smith <adrien[at]bouldersmiths[dot]com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: gueek <cyttam[at]gmail[dot]com>

pkgname=pngout
pkgver=20150319
pkgrel=2
pkgdesc="Lossless PNG compressor"
arch=('i686' 'x86_64')
url="http://www.jonof.id.au/kenutils"
license=('custom')
depends=('glibc')
source=("http://static.jonof.id.au/dl/kenutils/$pkgname-$pkgver-linux.tar.gz"
	      'pngout.completion'
	      'LICENSE')
sha512sums=('5700fd502c9c717ce8be37aedf0cbc512cc2a9e6197df9ac94bd38755f3c0b627b5acc5f5bf3da5ba8435698871334896876a44a716a0a1b08e685d95df60913'
            '0401518413a4f2dbfe648e5f5e5c14f472223f4612ce57bacaabfd8077f8bd08b5ebec25d59e5868807c5004829cd1cc7e782e5f945c8c4959ce13eafb44c8de'
            '0ca45cfd8c5963948cae63ab79339d7f33a1be4585fb8b94c8773771f4b33d6a6f3e854dd3abd68b0c13eec013d98d6406cd81af08a357265ee64c93dc203896')

package() {
  install -Dm755 "$pkgname-$pkgver-linux/${CARCH}/pngout" \
		"${pkgdir}/usr/bin/pngout"
  install -Dm644 "pngout.completion" "${pkgdir}/etc/bash_completion.d/pngout"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
