# Maintainer: c0gnitivefl0w
# Co-Maintainer: eldios

pkgname=seadrive-daemon
pkgver=2.0.10
pkgrel=1
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://download.seafile.com/published/seafile-user-manual/drive_client/drive_client_for_linux.md"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=('seadrive'
        "http://linux-clients.seafile.com/seadrive-deb/focal/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('25770d58f6e262a29e54a065ccf5e2d138ec5ec2aecaafa12fe2f6fe4ca256fb'
            '21136593bbf5074b708fe296ad30d27a8363b2c8d3ff3fdf91c77c5f4013bef7')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/seadrive" "${pkgdir}/usr/bin/seadrive"
  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/share/seadrive/seadrive"
}
