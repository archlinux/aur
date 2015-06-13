# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-us2
pkgver=980812
pkgrel=2
_pkgfile=us2
pkgdesc="An American English male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-us mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('185045d55456694f4f104173e43bbb89')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in us2 us2.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
