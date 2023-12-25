pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.4.4
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

options=(!strip)
license=('unknown')
depends=('gcc-libs' 'zlib' 'gtk3' 'systemd-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/bitdump/BLHeli/releases/download/Rev32.10/BLHeliSuite32xLinux64_1044.zip")
sha256sums=('162feb310cf4dbfd90553637d90d7a0dc24f5a6795731f848dc37e99e071b75e')

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/BLHeliSuite32xl/." "${pkgdir}/opt/${_pkgname}"
  install -m 777 -d "${pkgdir}/opt/${_pkgname}/Settings/"
  ln -s "/opt/${_pkgname}/BLHeliSuite32xl" "$pkgdir/usr/bin/${_pkgname}"
}
