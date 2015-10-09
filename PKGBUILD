# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
# Maintainer: syne <madlikene at aim dot com>
pkgname=mesquite
pkgver=3.04
_pkgver=304_Linux
buildver=build725
pkgrel=1
pkgdesc="A software package for evolutionary biology, designed to analyze comparative data about organisms"
arch=('any')
url="http://www.mesquiteproject.org/"
license=('LGPL')
depends=('java-runtime')
source=("https://github.com/MesquiteProject/MesquiteCore/releases/download/$pkgver$buildver/Mesquite$_pkgver.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('432bc66e03d68a7e7f0289510d603ce0'
         '8b62ba93f95aab14a8643bf5b939f465'
         'ef6d47b0a7aa27329165b1185982678e'
         '79604254490c2d8bbcbf54719ac99b6a')

package() {
  cd "${srcdir}/Mesquite_Folder"


  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 '{}' \;

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
