# Maintainer: c0gnitivefl0w
# Co-Maintainer: eldios

pkgname=seadrive-daemon
pkgver=2.0.16
pkgrel=1
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://www.seafile.com/en/download/ + https://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/seadrive-daemon/"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=("http://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d635d8d679c689d3abe0cf6a3ef4509c3fd5326690e9f887689415c289f93521')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/bin/seadrive"
}
