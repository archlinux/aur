# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-it1
pkgver=010213
pkgrel=2
_pkgfile=it1
pkgdesc="An Italian male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-it mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('8a356360b8f6f6c65597c50d237836db')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in it1 it1.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
