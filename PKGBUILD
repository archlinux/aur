# Contributor: bilux <i.bilux@gmail.com>
# Maintainer: bilux <i.bilux@gmail.com>

pkgname=mobydroid
pkgver=0.1
pkgrel=3
arch=('any')
pkgdesc="GUI for Android SDK/ADB, Android phone manager"
url="https://github.com/ibilux/MobyDroid"
license=('custom:proprietary')
depends=('java-runtime' 'android-tools')
source=("https://github.com/ibilux/MobyDroid/releases/download/v$pkgver/MobyDroid_v$pkgver.zip"
        "$pkgname.png"
        "$pkgname.desktop")

md5sums=('328e3d08b3604fc75f3707455781167d'
         '7118cfd58a0ac4d16b7818423226ce89'
         'db9b65688a89b2dd7448a4772f42655a')

package()
{
  cd "${srcdir}"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh"
  install -Dm755 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -Dm644 "${srcdir}/bin/busybox-arm" "${pkgdir}/usr/share/${pkgname}/bin/busybox-arm"
  install -Dm644 "${srcdir}/bin/busybox-x86" "${pkgdir}/usr/share/${pkgname}/bin/busybox-x86"
  install -Dm644 "${srcdir}/bin/aapt-arm" "${pkgdir}/usr/share/${pkgname}/bin/aapt-arm"
  install -Dm644 "${srcdir}/bin/aapt-x86" "${pkgdir}/usr/share/${pkgname}/bin/aapt-x86"

# icon and .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

# install
  install -d "${pkgdir}/usr/bin/"
  ln -s "${pkgdir}/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
