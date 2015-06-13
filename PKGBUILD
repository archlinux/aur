# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexandre Dantas <alex.dantas92@gmail.com>
# Contributor: Changaco <me@changaco.net>

pkgname=mbrola-voices-br2
pkgver=000119
pkgrel=2
_pkgfile=br2
pkgdesc="A Brazilian Portuguese male voice for the MBROLA synthesizer"
arch=('any')
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-br mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('7235536b1dd7470fed9b226464229ef5')

package() {
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in br2 br2.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
