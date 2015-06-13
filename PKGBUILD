# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr2
pkgver=980806
pkgrel=1
_pkgfile=fr2
pkgdesc="A French female voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('1488ea8ef76e97f1cf8af67963accf42')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr2 fr2.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
