pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.0.3
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

source=("BLHeliSuite32xLinux64_1003.zip::https://drive.google.com/uc?id=17evEFx4o2kFkVeQ7zTC3EH9OTe4SPSWw&export=download")
sha256sums=('67abe7bbe41910c1f9dc63c5995ae1b1855fe3c335906a50b9ac7dae530af3cc')

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
