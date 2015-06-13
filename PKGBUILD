# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-br3
pkgver=000119
pkgrel=4
_pkgfile=br3
pkgdesc="A Brazilian Portuguese male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-br mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('1ef7df34d66e5b87a97057199d0ec80a')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in br3 br3.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
