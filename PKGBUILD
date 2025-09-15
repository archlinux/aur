# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.7.3
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'perl' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'wget' 'zstd' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('1c83ea0acbea999169e5bc4d36a3657b9945e3ca9020b9e6190403f2fa5a7a63b3d555d69b159f38580ebbc962590a68f66cd173715a37f18dda935516909c6a')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
