# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.12
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'curl' 'debootstrap' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('083420cda579af016de94a1c5c562a26f27a55c2dad62728f62ef65a9ee205b8abd6512b4ab5c37a6da741001c6ef22be4b2865f78b0bd2df9cb7be8ab6c3c3f')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
