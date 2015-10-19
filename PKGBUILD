# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=jvmtop
pkgver=0.8.0
pkgrel=1
arch=('any')
pkgdesc="jvmtop is a lightweight console application to monitor all accessible, running jvms on a machine"
url="https://github.com/patric-r/jvmtop"
license="GPLv2"
depends=('java-environment')
options=('!strip')
source=("https://github.com/patric-r/jvmtop/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'change-jar-dir.patch')
sha1sums=('36b8980fb2b34d83ea3e91438f71afc4482df66c'
          'f3506f3796eab0f6555df701f818840ca3a6aa99')

prepare() {
  patch -Np0 -i "${srcdir}/change-jar-dir.patch"
}

package() {
  install -Dm0644 "${srcdir}/jvmtop.jar" "${pkgdir}/usr/share/java/jvmtop/jvmtop.jar"
  install -Dm0755 "${srcdir}/jvmtop.sh" "${pkgdir}/usr/bin/jvmtop"
}
