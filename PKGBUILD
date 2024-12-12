# Contributor: bilux <i.bilux@gmail.com>
# Maintainer: bilux <i.bilux@gmail.com>

pkgname=mobydroid
pkgver=0.7.2
pkgrel=1
arch=('any')
pkgdesc="GUI for Android SDK/ADB, Android phone manager"
url="https://github.com/ibilux/MobyDroid"
license=('custom:proprietary')
depends=('java-runtime' 'android-tools')
source=("https://github.com/ibilux/MobyDroid/releases/download/v$pkgver/MobyDroid_v$pkgver.zip"
        "$pkgname.png"
        "$pkgname.desktop"
        "$pkgname-arch.sh")

md5sums=('ab1f3501586ab36c8378ee346093c830'
         '7118cfd58a0ac4d16b7818423226ce89'
         '51bec0dc091c9b6ca6f98c435ec2bf62'
         '9f0bc607aee8683ded5c8eeb8411d364')

package()
{
  cd "${srcdir}"
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
  install -Dm755 "${srcdir}/${pkgname}-arch.sh" "${pkgdir}/usr/bin/${pkgname}"
}
