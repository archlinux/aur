# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr5
pkgver=991020
pkgrel=1
_pkgfile=fr5
pkgdesc="A French Belgian voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('2ebf4105702ab2aa037491338ed05ebb')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr5 fr5.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
