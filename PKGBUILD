pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.1.0
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

# Check Google Drive folder: https://drive.google.com/drive/folders/1Y1bUMnRRolmMD_lezL0FYd3aMBrNzCig
GDRIVENAME="BLHeliSuite32xLinux64_1010.zip"
GDRIVELINK="https://drive.google.com/file/d/1sZSIAqXAzTyuTdcCbut8wXCUGseaaNML/view?usp=sharing"

source=("$GDRIVENAME::https://drive.google.com/uc?export=download&id=$(echo "$GDRIVELINK" | cut -d'/' -f 6)")
sha256sums=('4c60f208a24729506f40a3fe710c9d8e22ab09794aa490b2413182408f7c43bb')

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
