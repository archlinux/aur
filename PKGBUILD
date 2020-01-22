# Maintainer: c0gnitivefl0w

pkgname=seadrive-daemon
pkgver=1.0.9
pkgrel=0
pkgdesc="Daemon part of seadrive"
arch=('x86_64')
url="https://www.seafile.com/en/help/drive_client_linux"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=('seadrive'
        "https://deb.seadrive.org/jessie/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('25770d58f6e262a29e54a065ccf5e2d138ec5ec2aecaafa12fe2f6fe4ca256fb'
            '2fe4bba4217423180b6085e35b4c0a81bd344d1413b87006fd35407a22e9723c')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/seadrive" "${pkgdir}/usr/bin/seadrive"
  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/share/seadrive/seadrive"
}
