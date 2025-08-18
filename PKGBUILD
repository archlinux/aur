# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.1
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/mintsuki/jinx"
license=("BSD")
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'grep' 'gzip' 'procps' 'tar' 'xz')
source=("git+https://codeberg.org/mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('8fab4c791fddb09431ce12d58e258a9ab75fe5ed0c20a23cef0186c4d16f2cbab8f3d3dc689ab2ab8ae36cad0ee08a9876b63ea625989b3eb2e52e8336712a09')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
