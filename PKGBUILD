# Maintainer: Muflone <webreg@vbsimple.net>
pkgname=mbrola-voices-ar2
pkgver=001015
pkgrel=1
_pkgfile=ar2
pkgdesc="An Arabic male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-ar mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('e6fe45cdeb1539f3ca882edc8e7915d3')

package(){
  cd "${srcdir}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in ar2 ar2.txt Test/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
