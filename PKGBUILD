# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-en1
pkgver=980910
pkgrel=3
_pkgfile=en1
pkgdesc="A British English male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-en mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('725b1fb0af1f6d62414d786de6eaa143')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/mbrola/${_pkgfile}/en1.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in en1 en1.txt en1mrpa TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
