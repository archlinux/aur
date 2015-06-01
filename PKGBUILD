# $Id: PKGBUILD 205029 2014-02-03 10:47:53Z bpiotrowski $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=bcprov151
pkgver=1.52
pkgrel=1
pkgdesc="Java cryptography APIs (Bouncy Castle)"
arch=('any')
url="http://www.bouncycastle.org/java.html"
license=('MIT')
conflicts=('bcprov')
provides=('bcprov')
noextract=(bcprov*.jar)
source=("http://www.bouncycastle.org/download/bcprov-jdk15on-${pkgver/./}.jar"
        "LICENSE.html")
md5sums=('873ac611cb0d7160c0a3d30eee964454'
         '38ea7412daeed75d7d755033d0fad407')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/java"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 bcprov-jdk15on-${pkgver/./}.jar "${pkgdir}/usr/share/java/bcprov.jar"
  install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
