# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr6
pkgver=010330
pkgrel=1
_pkgfile=fr6
pkgdesc="A French male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('ef58ccab7da88cbe582062a9468a4fb8')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr6 fr6.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
