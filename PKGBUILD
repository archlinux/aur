# Maintainer: danieltetraquark
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>
_pkgbase=v4l2loopback
pkgname=v4l2loopback-dkms
pkgver=0.12.4
pkgrel=4
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('any')
license=('GPLv2')
depends=('dkms')
makedepends=('help2man')
conflicts=("${_pkgbase}")
source=("https://github.com/umlaeute/v4l2loopback/archive/v$pkgver.tar.gz")
sha256sums=('6483a64050d1c32de909a34379913d2f949141ed37a2ccc250d491a40bf96af9')

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
  cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"

  make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}

# vim:set ts=2 sw=2 et:
