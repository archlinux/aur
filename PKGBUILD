# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: Changaco <me@changaco.net>
pkgname=mbrola-voices-fr1
pkgver=990204
pkgrel=2
_pkgfile=fr1
pkgdesc="A French male voice for the MBROLA synthesizer"
arch=(any)
url="http://tcts.fpms.ac.be/synthesis/mbrola.html"
groups=(mbrola-voices-fr mbrola-voices gespeaker-mbrola-voices)
depends=(mbrola)
license=(custom)
source=("http://tcts.fpms.ac.be/synthesis/mbrola/dba/${_pkgfile}/${_pkgfile}-${pkgver}.zip")
md5sums=('6031c6a97d2a7344e7ae42de294ae00b')

package(){
  cd "${srcdir}/${_pkgfile}"
  # Install license file
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/mbrola/${_pkgfile}/fr1.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install files
  for file in fr1 fr1.txt TEST/*
  do
    install -D -m 644 "${file}" "${pkgdir}/usr/share/mbrola/${_pkgfile}/${file}"
  done
}
