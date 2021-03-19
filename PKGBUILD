# Maintainer: Clansty <i@gao4.pw>
pkgname=electron-qq
pkgver=1.4.0
pkgrel=1
pkgdesc='A cross-platform QQ made with Electron'
license=('GPL')
depends=('electron')
arch=('any')
source=("app.asar::https://cf-ipfs.com/ipfs/QmSy8N9q3dB8PsF8G1wzXbBvHYZbL6JYp6UkcEhiHP3eQa"
        512x512.png
        electron-qq.desktop
        ${pkgname})

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 "512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${pkgname}.asar"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/local/sbin/${pkgname}"
} 

md5sums=('127476dafe5c96d600bbbe7b5840157b'
         'f6edfa276c96b746048458413b8c26ce'
         '77bdf165bded76c2bac542402e8fe35c'
         '58617d5f16ae1ba9041e19f87faa798f')
