# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.5.8
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/mintsuki/jinx"
license=("BSD")
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'git' 'grep' 'gzip' 'procps' 'tar' 'xz')
source=("git+https://codeberg.org/mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('50902875dc7ad21ac293c93c45e235f88dce1630b9b44f6e0f125934a131f59643e435ef43fc35b6f5255fd6b84b0ba7b7ca0039c05947287476ce80cdfab053')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
