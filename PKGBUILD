# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr3
pkgver=990324
pkgrel=1
_pkgfile=fr3
pkgdesc="A French male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('133c1631cd48e7c565779bd15d4ce536')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr3 fr3.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
