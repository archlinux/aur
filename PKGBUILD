# Maintainer: c0gnitivefl0w
# Co-Maintainer: eldios

pkgname=seadrive-daemon
pkgver=2.0.22
pkgrel=1
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://www.seafile.com/en/download/ + https://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/seadrive-daemon/"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=("http://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('8990b833647cc3c3ba2d58124f2cd8e27ad5a03cc768f4396a860700da7ac6f3')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/bin/seadrive"
}
