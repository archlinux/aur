# Maintainer: quest <quest at mac dot com>

pkgname=bluos-controller-appimage
_pkgname=bluos-controller
pkgver=4.4.1
pkgrel=2
pkgdesc="BluOS Controller application repackaged for Linux."
arch=('x86_64')
depends=('fuse2')
url="https://gitlab.com/fabrice.aeschbacher/bluos-controller-linux"
provides=('bluos-controller')

_bin="bluos-controller-linux-${pkgver}.AppImage"
source=("${_bin}::$url/-/package_files/145905927/download"
        'bluos-controller.desktop'
        'bluos-controller.png')
sha512sums=('bdf59ced8390c19d4d3f70998641dc1e69362524baea6ff359249e3f5cc2d317e4529b3438a9bbcee6399bfc5e2383a13e2a5f3d36d56d1ff1efef29d0714c1b'
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
