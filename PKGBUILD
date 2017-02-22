# Maintainer: Dan McCurry <dan.mccurry at linux dot com>

pkgname=('ttf-y14.5m' 'ttf-y14.5m-docs')
pkgver=1
pkgrel=1
pkgdesc="Mechanical engineering fonts with regards to the ASME Y14.5 standard."
arch=('any')
url="https://cstools.asme.org/csconnect/CommitteePages.cfm?Committee=C64000000&Action=40068"
license=('custom:copyright')
source=('http://www.fontspace.com/download/9006/862de5cd3f6f417f9e56e9d12fa58f5d/micronus_y145m-2009.zip'
	'http://www.fontspace.com/download/6341/b1f81ad37c364d9e8122079657d70035/micronus_y145m.zip'
	'http://www.fontspace.com/download/9007/dc81ff928cab49bfaedfef825b5c8762/micronus_weldsymbols.zip'
	'local://COPYRIGHT')
md5sums=('81178ab98fe87ccdc9a0926521f9bde1'
         '9974425c007a3b8cc83c5f4a38143cac'
         '1d765e5f492606fd729e0d307ccec636'
         'bdfa36bc4ecf87278f63e64dfee002c6')

package_ttf-y14.5m() { 
 provides=('ttf-y14.5m')

 cd ${srcdir}
  for font in *.ttf; do
    install -Dm644 $font "${pkgdir}/usr/share/fonts/TTF/$font"
  done
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}

package_ttf-y14.5m-docs() {
  pkgdesc="$pkgdesc (docs)"
  depends=("$pkgbase")

  cd ${srcdir}
  install -Dm644 FontTable.pdf \
	  "${pkgdir}/usr/share/doc/${pkgname}/fonttable.pdf"
  install -Dm644 "Y15 5M-2009FontInfo.pdf" \
          "${pkgdir}/usr/share/doc/${pkgname}/fontinfo.pdf"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgbase}/COPYRIGHT" \
          "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
