# Maintainer: Valdis Vitolins <valdis.vitolins@odo.lv>
pkgname=mbrola-voices-ar1
pkgver=981103
pkgrel=1
_pkgfile=ar1
pkgdesc="An Arabic male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-ar mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
sha256sums=('38e65ce5f667fc6a9ded5e8c45f1924f2b4cd920c12ba1fbc9dfbe190a573d42')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in ar1 ar1.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
