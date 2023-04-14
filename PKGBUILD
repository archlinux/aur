# Maintainer: dr00tb <adam at dr00tb dot com>

pkgname=tkey-ssh-agent
_pkgname=tillitis-key1-apps
pkgver=0.0.6
pkgrel=2
pkgdesc="A ssh-agent for the Tillitis TKey"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tillitis/tillitis-key1-apps"
license=('GPL2')
makedepends=('clang' 'llvm' 'lld' 'go')
source=("https://github.com/tillitis/tillitis-key1-apps/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d15fc7f556548951989abf6973374f71e039028202e8cad4b70f79539da00aff')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make OBJCOPY="llvm-objcopy" apps tkey-ssh-agent
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

