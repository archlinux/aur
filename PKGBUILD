# Maintainer: Mangix <rosenp@gmail.com>

pkgname=kzipmix
pkgver=20150319
pkgrel=1
pkgdesc="Ken Silverman's ZIP compressor"
arch=('i686' 'x86_64')
url="http://www.jonof.id.au/kenutils"
license=('custom')
source=(http://static.jonof.id.au/dl/kenutils/$pkgname-${pkgver}-linux.tar.gz
	kzip.completion
	zipmix.completion
	LICENSE)
md5sums=('90568d3b6a901f6eedab9e9bd23f23d7'
         '570e381fa45eead43054c287790cc07d'
	 '0b9327bd4b9186e09590b5bc478c9bab'
         '6aca04829b82718d2cb26c9b45f9a570')

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux/${CARCH}/kzip \
		${pkgdir}/usr/bin/kzip
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}-linux/${CARCH}/zipmix \
		${pkgdir}/usr/bin/zipmix
  install -Dm644 ${srcdir}/kzip.completion ${pkgdir}/etc/bash_completion.d/kzip
  install -Dm644 ${srcdir}/zipmix.completion ${pkgdir}/etc/bash_completion.d/zipmix
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
