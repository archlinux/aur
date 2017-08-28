# Maintainer: Oscar Morante <spacepluk@gmail.com>

pkgname=jbake
pkgver=2.5.1
pkgrel=1
pkgdesc="JBake is a Java based, open source, static site/blog generator for developers & designers"
arch=('any')
url="http://jbake.org"
license=('MIT')
depends=('bash' 'java-environment')
source=("jbake-${pkgver}-bin.zip::http://hash.to/5tc")
md5sums=('4c3c190e6b8e2cebe076c8d5e9a2ab1d')

package() {
  cd "${srcdir}/jbake-${pkgver}"
  . /etc/profile.d/jre.sh

  install -m644 -Dt "${pkgdir}/opt/jbake/lib" lib/*
  install -m644 -Dt "${pkgdir}/opt/jbake" jbake-core.jar
  install -m755 -Dt "${pkgdir}/opt/jbake/bin" bin/jbake
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/opt/jbake/bin/jbake" "${pkgdir}/usr/bin/jbake"
}

