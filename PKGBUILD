# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-gr2
pkgver=010521
pkgrel=3
_pkgfile=gr2
pkgdesc="A Greek male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-gr mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('30f550cc01c1c1567ce4b12b4244649a')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in gr2 gr2.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
