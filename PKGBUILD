# Maintainer <tianyu at vt dot edu>

pkgname=pinegrow
pkgver=3.01
pkgrel=3
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('custom')
source=("https://pinegrow.s3.amazonaws.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf")
noextract=("Pinegrow_EULA.pdf")
sha1sums=("d9dce8cac9b95e97dd9b8df93173ee94ca5ab827"
          "a69404f2d55d4c8dd8d47c54dbadad9e08573e6c")

prepare() {
  cd "${srcdir}"

  unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/pinegrow"
  mkdir -p "${pkgdir}/usr/share/applications"

  cp -p "./Pinegrow_EULA.pdf" "/usr/share/pinegrow"
  cp -pdr "./Pinegrow-${pkgver}" "/usr/share/pinegrow"
  ln -fs "/usr/share/pinegrow/Pinegrow-${pkgver}/Pinegrow.desktop" "/usr/share/applications/pinegrow.desktop"
  ln -fs "/usr/share/pinegrow/Pinegrow-${pkgver}/PinegrowLibrary" "/usr/bin/pinegrow"
}
