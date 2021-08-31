# Maintainer: c0gnitivefl0w
# Co-Maintainer: eldios

pkgname=seadrive-daemon
pkgver=2.0.15
pkgrel=1
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://www.seafile.com/en/download/"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=("http://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('ae1bcb14dd2e85cdaa32d14140e87e81ec3915cb356b1a32e89e97fe282e0ba3')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/bin/seadrive"
}
