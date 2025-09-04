# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.9
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'curl' 'debootstrap' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('99af6098041dd1b1f662bfffdc375ce8bca76b5cd36c7d405ecf8ed41dd62be760c9905a82b097dd02c8cb8e4956a64f88f16c23d355d4468c90e16b8e9d06ef')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
