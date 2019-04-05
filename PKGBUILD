# Maintainer: LinRs <20455421+LinRs at users.noreply.github.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=linux_logo
pkgver=5.11
pkgrel=5
pkgdesc="Text-based logo and system information program"
arch=('x86_64')
url="https://github.com/deater/linux_logo"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  find ./logos -type f | sort > logo_config
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install
}
