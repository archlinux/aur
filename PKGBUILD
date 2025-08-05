# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.0
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/mintsuki/jinx"
license=("BSD")
depends=('sh' 'curl' 'findutils' 'awk' 'gcc' 'grep' 'gzip' 'procps' 'tar' 'xz')
source=("git+https://codeberg.org/mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('564215bb9363549ec255aca2d0c7c93d8d39b0c837208a8c7dfaa1bad8e317884d9d03e74cdd97fd82bfa5af7987db4858c349d84284466de8705af9dd69bbd8')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
