# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-ca2
pkgver=1
pkgrel=2
_pkgfile=ca2
pkgdesc="A Canadian French male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-ca mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}.zip")
md5sums=('48934187a27b2b70fffbabe60c6a43cb')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in ca2 Ca2.txt test/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
