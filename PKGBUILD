# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-daemon
pkgver=0.7.0
pkgrel=3
pkgdesc="Daemon part of seadrive"
arch=('i686' 'x86_64')
url="https://bintray.com/seafile-org/deb-unstable/seadrive-daemon"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'libevent-compat'
         'openssl-1.0' 'fuse2')
source=('seadrive')
source_i686=("https://deb.seadrive.org/jessie/pool/main/s/${pkgname}/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://deb.seadrive.org/jessie/pool/main/s/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('2e9e171daeee5013d5fcbb86160a9ea195a8bb8eb0b181c3b9cfdbf611a68a6e')
sha256sums_i686=('99ab9acb7c00eb6c267127ac679992df83a35685634108e4f0a524f05bed6b7d')
sha256sums_x86_64=('b9cd91c804def1aeeba6f313794559f3fc33abb634643808ebecd0e42b0ab034')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/seadrive" "${pkgdir}/usr/bin/seadrive"
  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/share/seadrive/seadrive"
}
