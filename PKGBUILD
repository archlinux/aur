pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=0.9.2.0
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs (Beta)"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

source=("BLHeliSuite32xLinux64_Beta_0920.zip::https://drive.google.com/uc?id=1IHAMn2iPNCKAwW4QalCv7Q_WHs3dzBpJ&export=download")
sha256sums=('78e79a2a8ffb87e71b5b9a5ebe6fdbed1dfe722674e9a002a3fa137dde4fbbe1')

options=(!strip)
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/BLHeliSuite32xl/." "${pkgdir}/opt/${_pkgname}"
  install -m 777 -d "${pkgdir}/opt/${_pkgname}/Settings/"
  ln -s "/opt/${_pkgname}/BLHeliSuite32xl" "$pkgdir/usr/bin/${_pkgname}"
}
