# Maintainer: Robin Nehls <aur@manol.is>

pkgname=libtpms
pkgver=0.5.2.1
pkgrel=1
pkgdesc="The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2)"
arch=('i686' 'x86_64')
url="https://github.com/stefanberger/libtpms"
license=(unknown)
depends=('openssl' 'zlib')
makedepends=('automake' 'autoconf')
provides=('libtpms')
source=("git+https://github.com/stefanberger/libtpms.git#tag=v${pkgver}")
sha1sums=('SKIP')
_gitname=libtpms

build() {
  cd $_gitname
  ./bootstrap.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
