pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.0.9
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

# Check Google Drive folder: https://drive.google.com/drive/folders/1Y1bUMnRRolmMD_lezL0FYd3aMBrNzCig
source=("BLHeliSuite32xLinux64_1009.zip::https://drive.google.com/uc?export=download&id=1VyG_KG34N1VzpGHH-qiVysOU-zLnZECI")
sha256sums=('09589aca1e963fbf859b39926429f73056ecaee0e602cc4fec195bec249df22d')

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
