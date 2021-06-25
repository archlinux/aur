# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.5.7
pkgrel=1
pkgdesc='A cross-platform QQ made with Electron'
license=('GPL')
depends=('electron')
optdepends=('mongodb-bin: Provides storage'
            'redis: Provides storage'
            'gwenview: Image viewer'
            'eog: Image viewer'
            'eom: Image viewer'
            'ristretto: Image viewer'
            'okular: Image viewer'
            'gimp: Image viewer')
arch=('any')
url="https://github.com/Clansty/electron-qq"
source=("app-${pkgver}.asar::https://github.com/Clansty/${pkgname}/releases/download/v${pkgver}/app.asar"
        512x512.png
        ${pkgname}.desktop
        ${pkgname})

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.asar"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
} 

md5sums=('4328b63eb9e3d0dde20e2d6b7175b453'
         '215fb139ab700bf2632f568c4e564d68'
         '77bdf165bded76c2bac542402e8fe35c'
         'f88f67ee85da8a00d21770ef73b02915')
