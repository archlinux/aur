# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Uli Armbruster <uli armbruster goole mail service>

pkgbase=neroaac-bin
pkgname=('neroaacdec-bin'
         'neroaacenc-bin'
         'neroaactag-bin'
         )
pkgver=1.5.4
_pkgver=1.5.1
pkgrel=4
arch=('x86_64')
pkgdesc="Nero AAC reference quality MPEG-4 and 3GPP audio codec"
url='http://www.nero.com'
depends=('lib32-gcc-libs')
license=('custom')
source=("https://web.archive.org/web/20170610150750/http://ftp6.nero.com/tools/NeroAACCodec-${_pkgver}.zip")
sha256sums=('e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b')

package_neroaacdec-bin() {
  pkgdesc="Nero AAC reference quality MPEG-4 and 3GPP audio codec. Decoder"
  provides=('neroaacdec')
  conflicts=('neroaacdec'
             'neroaac'
             )

  install -D -m755 linux/neroAacDec "${pkgdir}/usr/bin/neroAacDec"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neroaacenc-bin() {
  pkgdesc="Nero AAC reference quality MPEG-4 and 3GPP audio codec. Encoder"
  provides=('neroaacenc')
  conflicts=('neroaacenc'
             'neroaac'
             )
  install -D -m755 linux/neroAacEnc "${pkgdir}/usr/bin/neroAacEnc"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neroaactag-bin() {
  pkgdesc="Nero AAC reference quality MPEG-4 and 3GPP audio codec. Tag editor"
  provides=('neroaactag')
  conflicts=('neroaactag'
             'neroaac'
             )

  install -D -m755 linux/neroAacTag "${pkgdir}/usr/bin/neroAacTag"
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}