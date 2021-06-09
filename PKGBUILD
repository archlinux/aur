# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=openrdate
pkgver=1.10
pkgrel=1
pkgdesc="Set the system's date from a remote host"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/resurrecting-open-source-projects/openrdate"
license=("unknown")
depends=('libbsd')
makedepends=('autoconf' 'automake')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8a29eed664e1ba3f628ac16227da2f872d595ddf0be2daee23fbc9da7fc7846a')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
