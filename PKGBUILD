# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor:  LinRs <20455421+LinRs at users.noreply.github.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=linux_logo
pkgver=6.01
pkgrel=1
pkgdesc="Text-based logo and system information program"
arch=('x86_64')
url="https://github.com/deater/linux_logo"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=("https://github.com/deater/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('50c6d2188483f4038c9553b3a90ed1d9b1b8f5fc18cd6c433f324454f50c3befafb8f0bf2b1c51208eeaa55393bccfb04e64d8632e501cd305f0ee5dbe6da159')

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
