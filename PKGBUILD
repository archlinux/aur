# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info-data
pkgver=0.61
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
checkdepends=('python')
options=(!emptydirs)
source=("http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('3c104f8294e1d239dd76ad16a606d8b7f36624bcdb727d7452cd3e326f0e998b')

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  install -D -m 644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}

# vim:set ts=2 sw=2 et:
