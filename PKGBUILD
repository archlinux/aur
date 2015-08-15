# Maintainer: Romain Schmitz <slopjong [[at]] hackerspace [[dot]] lu>
pkgname=erwiz
pkgver=(0.9.0)
pkgrel=3
pkgdesc="A lightweight tool to convert text-based entity-relationship models to images."
arch=('i686' 'x86_64')
url="http://erwiz.org"
license=('custom:BSD')
depends=('java-runtime' 'graphviz')
changelog=${pkgname}.changelog
source=(http://erwiz.de/download/${pkgname}-${pkgver}-bin.tar.gz)
#source=(${pkgname}-${pkgver}-bin.tar.gz)
md5sums=(cf25f05c8462e5f80e7b16f15c76ff4e)

package() {
  
  # prepare the fake filesystem
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
        
  # install the binaries and symlink erwiz in /usr/bin
  cp -R ${srcdir}/${pkgname}-${pkgver}-bin/bin ${pkgdir}/usr/share/java/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}-bin/jar ${pkgdir}/usr/share/java/${pkgname}
  ln -s /usr/share/java/${pkgname}/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  
  # install the documentation and examples
  cp -R ${srcdir}/${pkgname}-${pkgver}-bin/doc/htmldoc "${pkgdir}/usr/share/doc/${pkgname}/htmldoc"
  cp -R ${srcdir}/${pkgname}-${pkgver}-bin/doc/examples "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}-bin/readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  
  # install the license stuff
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}-bin/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}-bin/authors.txt "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}

# vim:set ts=2 sw=2 et:
