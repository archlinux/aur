# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Florian Daniel <fd@noxa.de>
# Contributor: Eldar Tsraev <elts@culab.org>
# Contributor: Andreas Guth <andreas.guth@rwth-aachen.de>
# Contributor: Alexander Neumann <alexander@bumpern.de>

options=(!strip)
pkgname=restic
pkgver=0.7.0
pkgrel=1
pkgdesc="restic is a program that does backups right."
arch=('i686' 'x86_64')
url="https://restic.github.io"
license=('BSD')
depends=('glibc')
makedepends=('go>=1.7')
conflicts=('restic-git')
source=("https://github.com/restic/restic/archive/v${pkgver}.tar.gz")
sha256sums=('0d50e846429005fb78cb8d62876a8f0748942d7422cb115aba2d0669d25afee7')

#importpath='github.com/restic/restic'

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go run build.go
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "restic"    "${pkgdir}/usr/bin/restic"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
