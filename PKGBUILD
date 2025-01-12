# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Daenyth <Daenyth+Arch [AT] gmail [DOT] com>
# Contributor: Peter Guerndt <peterguer@gmail.com> 
# Contributor: Øyvind Wilhelsem  <oeywil@gmail.com>

pkgname="pwnat"
pkgver=0.3.0
pkgrel=2
pkgdesc="A tool that allows clients behind NAT to communicate without any port forwarding"
arch=('x86_64' 'i686')
url="https://samy.pl/pwnat"
_url="https://github.com/samyk/${pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('96f91039a6244eb0c9028722f72440c3437cdc38b4c463eaa5d07534650b39ef263683be2f20d10383e7d9795cf137476985033a7f6c827fdedb9ce87a43d4e7')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "Changes" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "manpage.txt" "${pkgdir}/usr/share/doc/${pkgname}/manpage.txt"
  install -vDm644 "COPYING-pingtunnel" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
