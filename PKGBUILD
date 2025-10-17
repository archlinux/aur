# Maintainer: quest <quest at mac dot com>

pkgname=bluos-controller-appimage
_pkgname=bluos-controller
pkgver=4.12.0
pkgrel=0
pkgdesc="BluOS Controller application repackaged for Linux."
arch=('x86_64')
depends=('fuse2')
url="https://gitlab.com/zquestz/bluos-controller-linux"
provides=('bluos-controller')

_bin="bluos-controller-linux-${pkgver}.AppImage"
source=("${_bin}::$url/-/package_files/238508453/download"
        'bluos-controller.desktop'
        'bluos-controller.png')
sha512sums=('88d9361ada23d785c7aa23873df4bd57524c2c35519443bb656cedfeccafc2270cc357a7ba8bd75983f14efee4bb5243d5ec8ff50532640acb96b1434dcc4945'
            '575a90b261b62800919ae8dacb3f9d1d194cbb813153ef2b2bb26ac4b95f03ccd8bc09f513f39c2a1ac66b797a5ca084bda3e27464d472edc2b1b88620e9b096'
            '8985c4311fc68658e32b8607a4ac71c0ad88210fd7f2b05f2149a870adce9fdb3c3813585858474aabbd70bf6452a7cfd91de6bcc669e7e08d88577403fee3e6')

options=('!strip' '!emptydirs')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/bluos-controller/${_bin}"
  install -Dm644 "${srcdir}/bluos-controller.desktop" "${pkgdir}/usr/share/applications/bluos-controller.desktop"
  install -Dm644 "${srcdir}/bluos-controller.png" "${pkgdir}/opt/bluos-controller/bluos-controller.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/bluos-controller/${_bin}" "${pkgdir}/usr/bin/bluos-controller"
}
