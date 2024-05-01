# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info-data
pkgver=0.62
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
checkdepends=('python')
options=(!emptydirs)
source=("http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d2f2b7073c4e02e11dc16ec430a17187cdf8a7599afde324e9ecae6c7563a32e')

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
