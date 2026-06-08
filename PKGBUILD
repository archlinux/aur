# Maintainer: quest <quest at mac dot com>

pkgname=bluos-controller-appimage
_pkgname=bluos-controller
pkgver=4.14.1
pkgrel=1
pkgdesc="BluOS Controller application repackaged for Linux."
arch=('x86_64')
depends=('fuse2')
url="https://gitlab.com/zquestz/bluos-controller-linux"
provides=('bluos-controller')

_bin="bluos-controller-linux-${pkgver}.AppImage"
source=("${_bin}::$url/-/package_files/308734129/download"
        'bluos-controller.desktop'
        'bluos-controller.png')
sha512sums=('73f643b764993dcb704587608539c5d9321f996bf8916d9a87e5b806b038e8e5f88e858548586316f2055421890c9e5d529fa326278ee00083ef6631f79bef8f'
            '1f038bbfd6e0095c745defdb7928bf5ed852198d1959ffc8e8f8664d4b77366b5d85cf4e1c6f810ce70644793048a46d02b3041747413bd3a61bf75039648497'
            '8985c4311fc68658e32b8607a4ac71c0ad88210fd7f2b05f2149a870adce9fdb3c3813585858474aabbd70bf6452a7cfd91de6bcc669e7e08d88577403fee3e6')

options=('!strip' '!emptydirs')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/bluos-controller/${_bin}"
  install -Dm644 "${srcdir}/bluos-controller.desktop" "${pkgdir}/usr/share/applications/bluos-controller.desktop"
  install -Dm644 "${srcdir}/bluos-controller.png" "${pkgdir}/opt/bluos-controller/bluos-controller.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/bluos-controller/${_bin}" "${pkgdir}/usr/bin/bluos-controller"
}
