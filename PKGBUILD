# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=seadrive-daemon
pkgver=0.6.1
pkgrel=2
pkgdesc="Daemon part of seadrive"
arch=('i686' 'x86_64')
url="https://bintray.com/seafile-org/deb-unstable/seadrive-daemon"
license=('Apache')
depends=('libsearpc' 'libcurl-compat' 'openssl-1.0' 'fuse2' 'libevent')
source=('seadrive')
source_i686=("https://dl.bintray.com/seafile-org/deb-unstable/jessie/pool/main/s/seadrive-daemon/seadrive-daemon_0.6.1_i386.deb")
source_x86_64=("https://dl.bintray.com/seafile-org/deb-unstable/jessie/pool/main/s/seadrive-daemon/seadrive-daemon_0.6.1_amd64.deb")
sha256sums=('84d5123465ae17cf5b9f3a326e6364fcaf0ffc58f4df693670414895cf38b5f3')
sha256sums_i686=('a2cbe633b18ec63be0933f85a360004b5e060b3d847fdbe57392cf561aa94f48')
sha256sums_x86_64=('d76957bd954c05e54646c133c33c6b9d115a72f73d0c71944b0345574da422f8')

prepare() {
  cd "${srcdir}"

  tar -xJf data.tar.xz
}

package () {
  cd "${srcdir}"

  install -Dm 755 "${srcdir}/seadrive" "${pkgdir}/usr/bin/seadrive"
  install -Dm 755 "${srcdir}/usr/bin/seadrive" "${pkgdir}/usr/share/seadrive/seadrive"
}
