# Maintainer: Geneanet <app-upload@geneanet.org>


pkgname=geneanet
pkgver=4.0.0
pkgrel=1
_date=20210618
pkgdesc='Software to upload a GEDCOM and its associated media to Geneanet'
arch=('any')
url='https://geneanet.org'
license=('MIT')

depends=('electron9')
makedepends=(gendesk)
source=("$url/public/geneanet-upload/geneanet-upload-last-linux-x64.deb" "geneanet")

prepare() {
  cd "${srcdir}"
  bsdtar xf data.*
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --icon="/usr/share/pixmaps/${pkgname}.png" --categories="Office" --comment="$pkgdesc"
}

package() {
  install -d ${pkgdir}/opt/Geneanet\ Upload
  install -m644 /$srcdir/opt/Geneanet\ Upload/resources/app.asar ${pkgdir}/opt/Geneanet\ Upload

  install -d ${pkgdir}/usr/bin
  #ln -s ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -m775 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -d ${pkgdir}/usr/share/applications
  install -m644 /$srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications
  
  install -d ${pkgdir}/usr/share/pixmaps
  install -m644 $srcdir/usr/share/icons/hicolor/256x256/apps/geneanet-upload.png ${pkgdir}/usr/share/pixmaps/geneanet.png
}

# vim:set ts=2 sw=2 et:
md5sums=('878afae457df7d32beca45f38c0047f4'
         '3026da3541de8be19b187849693973d8')
sha512sums=('ad80246b773146ea3e0f4484c8d890ce53a6c8da59e1a991d4934272f0fb8569930cb9bb178b70f4417de008cae7dbb2a4726ae7cc4b7d730a31c4a09e8321cf'
            'ff01b1e554c7f98a23e71574d88c6bcc68ecae15cc3b3ea20842f39f6ac9a8c4f0f955e88a648bc9a24cc9a4132a6d470f4e75c0f34007dbacc17527af3da79e')
b2sums=('566b6431027263883235e3b3067edf9748e4cff9a396c72fb664bb87c9b96a75fc4b6c0be849adc4dfbe08ba7c5048167898d630b7d028ddc270d82729aa37a4'
        'd93257b74f68afb71fd473bd37b12cc3cae647542544e964ee48c797fbbc4aec828aa723a9a287119175a4ee33feda674b301efbf8dcefaf7ffd9ddfd24f6bd6')
