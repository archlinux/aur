# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr7
pkgver=010330
pkgrel=1
_pkgfile=fr7
pkgdesc="A French Belgian voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('2a0c06030dda4e1edcb0e972ede092b7')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "fr7.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr7 fr7.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
