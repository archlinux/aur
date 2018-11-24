# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-daemon
pkgver=1.0.0
pkgrel=0
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://www.seafile.com/en/help/drive_client_linux"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=('seadrive'
        "https://deb.seadrive.org/jessie/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('2e9e171daeee5013d5fcbb86160a9ea195a8bb8eb0b181c3b9cfdbf611a68a6e'
            '3491f666ccf4b8441a508d18961d4257b10bf7578837c38223abf58f1f7bcb26')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/seadrive" "${pkgdir}/usr/bin/seadrive"
  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/share/seadrive/seadrive"
}
