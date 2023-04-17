# Maintainer: cembro <cembro at pm dot me>

pkgname=tillitis-key1-apps-signer
_pkgname=tillitis-key1-apps
pkgver=0.0.6
pkgrel=1

pkgdesc="Signer device app for the Tillitis TKey, to use with tkey-ssh-agent2"
arch=('any')
url="https://github.com/tillitis/tillitis-key1-apps"
license=('GPL-2.0-only')
makedepends=('clang' 'llvm' 'lld')
install=tillitis-key1-apps-signer.install
source=("https://github.com/tillitis/tillitis-key1-apps/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d15fc7f556548951989abf6973374f71e039028202e8cad4b70f79539da00aff')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make OBJCOPY="llvm-objcopy" apps
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 "apps/signer/app.bin" "$pkgdir/usr/share/tillitis/signer.app.bin"
}

