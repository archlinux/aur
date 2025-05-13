# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.5.7
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/mintsuki/jinx"
license=("BSD")
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'git' 'grep' 'gzip' 'procps' 'tar' 'xz')
source=("git+https://codeberg.org/mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('8610c91ec353f68c4184ff5b5706a73c158dbd050eacf911403c1d44aebce2b69e17396b53c9ceae3cfa38c0dedfc7b59ec5253ef3267d4385b00a76204bb36a')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
