# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=clipster-git
_pkgname=clipster
pkgver=0.156.bac5833
pkgrel=1
pkgdesc="python clipboard manager"
arch=('any')
url="https://github.com/mrichar1/clipster"
license=('AGPL')
depends=('python-gobject' 'libwnck3')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/mrichar1/clipster.git')
md5sums=('SKIP')
provides=('clipster')
conflicts=('clipster')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}

# vim:set ts=2 sw=2 et:
