pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

source=("BLHeliSuite32xLinux64_1001.zip::https://drive.google.com/uc?id=1MKgQU38-iwjHcFTFgnEQjffjfW3pufHj&export=download")
sha256sums=('7bba6132047601c5035ecff2e92a186c1943086faadc56ac835ce9a71d71fda6')

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
