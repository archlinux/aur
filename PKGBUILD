pkgname=clrmamepro
pkgver=4.029.b
pkgrel=1
pkgdesc="A ROM manager for MAME."
arch=('any')
url="http://mamedev.emulab.it/clrmamepro/"
license=('custom')
depends=('wine')
makedepends=('icoutils')
source=("http://mamedev.emulab.it/clrmamepro/binaries/cmp${pkgver//./}_32.zip"
        "clrmamepro"
        "clrmamepro.desktop")
sha256sums=('cc7f7b80d74d4a58cedb5595fbe58100a6dce2165e2dd4dedbda6f83ed53f2f8'
            '466f1cd863e85915f8355463a1062e394296228b17cbdfe101357b3266b988f5'
            '8d92a074639a43cb5d7ed69df999d059dd81fca9f3967a58873db0acafb0d95b')

build() {
  wrestool -x -n 500 -o . cmpro.exe
  icotool -x -o . cmpro.exe_14_500_1031.ico
}

package() {
  install -Dm644 "${srcdir}/7z_32.dll" "${pkgdir}/usr/share/clrmamepro/7z_32.dll"
  install -Dm755 "${srcdir}/cmpro.exe" "${pkgdir}/usr/share/clrmamepro/cmpro.exe"
  install -Dm644 "${srcdir}/engine.cfg" "${pkgdir}/usr/share/clrmamepro/engine.cfg"
  install -Dm644 "${srcdir}/setformat.xml" "${pkgdir}/usr/share/clrmamepro/setformat.xml"
  install -Dm644 "${srcdir}/stats.ini" "${pkgdir}/usr/share/clrmamepro/stats.ini"
  install -Dm644 "${srcdir}/unrar.dll" "${pkgdir}/usr/share/clrmamepro/unrar.dll"
  install -Dm644 "${srcdir}/update.dll" "${pkgdir}/usr/share/clrmamepro/update.dll"
  install -Dm644 "${srcdir}/urls.ini" "${pkgdir}/usr/share/clrmamepro/urls.ini"
  install -Dm644 "${srcdir}/version.ini" "${pkgdir}/usr/share/clrmamepro/version.ini"

  install -Dm755 "${srcdir}/clrmamepro" "${pkgdir}/usr/bin/clrmamepro"

  install -Dm644 "${srcdir}/clrmamepro.desktop" "${pkgdir}/usr/share/applications/clrmamepro.desktop"

  install -Dm644 "${srcdir}/cmpro.exe_14_500_1031_4_16x16x32.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/clrmamepro.png"
  install -Dm644 "${srcdir}/cmpro.exe_14_500_1031_5_32x32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/clrmamepro.png"
  install -Dm644 "${srcdir}/cmpro.exe_14_500_1031_6_48x48x32.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/clrmamepro.png"
}
