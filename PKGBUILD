pkgname=blhelisuite32-bin
_pkgname=blhelisuite32
pkgver=1.0.2.0
pkgrel=1
pkgdesc="Configuration tool for BLHeli_32 based ESCs"
arch=('x86_64')
url="https://github.com/bitdump/BLHeli/tree/master/BLHeli_32%20ARM"

# Check Google Drive folder: https://drive.google.com/drive/folders/1Y1bUMnRRolmMD_lezL0FYd3aMBrNzCig
GDRIVENAME="BLHeliSuite32xLinux64_1020.zip"
GDRIVELINK="https://drive.google.com/file/d/1j8C_CjSOTmRj9q2OaMZu-3BkrUo1Uht-/view?usp=sharing"

source=("$GDRIVENAME::https://drive.google.com/uc?export=download&id=$(echo "$GDRIVELINK" | cut -d'/' -f 6)")
sha256sums=('acea893fecd884b7caf3e64ed39c572d613400d5eb27c4c80ff4b29eb2b7c993')

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
