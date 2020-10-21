pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.0.7
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

source=("BLHeliSuite32xLinux64_1007.zip::https://drive.google.com/uc?id=1rUIHzQgAP5gT0PZN2TA9DagaggZEqVuk&export=download")
sha256sums=('d2298b35c1f1d9c797fc625b5ccd18360a3a244b8c1e64a167df6be1a19faa07')

options=(!strip)
license=('unknown')
depends=('libcurl-gnutls')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/BLHeliSuite32xl/." "${pkgdir}/opt/${_pkgname}"
  install -m 777 -d "${pkgdir}/opt/${_pkgname}/Settings/"
  ln -s "/opt/${_pkgname}/BLHeliSuite32xl" "$pkgdir/usr/bin/${_pkgname}"
}
