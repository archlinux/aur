# Maintainer: Aaron Graves <linux@ajgraves.com>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.5.15
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=('x86_64')
url="https://cryptomator.org/"
license=('GPL3')
depends=('fuse2')
source=("cryptomator-${pkgver}-${pkgrel}-x86_64.AppImage::https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/cryptomator-${pkgver}-x86_64.AppImage"
        'org.cryptomator.Cryptomator.desktop'
        'org.cryptomator.Cryptomator.png'
        'org.cryptomator.Cryptomator.svg'
        'cryptomator-vault.xml')
sha256sums=('cdaa5221fc166fed76fe4a894939d335559e8840d8c354e3e1c8fd2135dfccd5'
            '53c509fe54ef1c5c28b469d86291536649367fb2030b2c0fb3101da2031f8e6e'
            'd299636d78d093117fa7a26563f22e01cdb75b1fcc6cc279bc88627574c968bd'
            '0989ecc24ecd672c5c525ab6f1f0fb18a9eeca86ebec19738f512801c152f756'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad')
options=('!strip')

package() {
  install -Dm755 "${srcdir}/cryptomator-${pkgver}-${pkgrel}-x86_64.AppImage" "${pkgdir}/opt/cryptomator/cryptomator-${pkgver}-x86_64.AppImage"
  install -Dm644 "${srcdir}/cryptomator-vault.xml" "${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.desktop" "${pkgdir}/usr/share/applications/org.cryptomator.Cryptomator.desktop"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.cryptomator.Cryptomator.png"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.svg" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.svg"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/cryptomator/cryptomator-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/cryptomator"
}
