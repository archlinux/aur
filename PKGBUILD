pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

source=("BLHeliSuite32xLinux64_1000.zip::https://drive.google.com/uc?id=1Zhv-W7n726KA6UNOwnnK5h9q8AXb2DNv&export=download")
sha256sums=('d5c627f4a354d9dbdac87ac957562753c988bf01b3e86efe3261a23f774e1dc0')

options=(!strip)
license=('unknown')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/BLHeliSuite32xl/." "${pkgdir}/opt/${_pkgname}"
  install -m 777 -d "${pkgdir}/opt/${_pkgname}/Settings/"
  ln -s "/opt/${_pkgname}/BLHeliSuite32xl" "$pkgdir/usr/bin/${_pkgname}"
}
