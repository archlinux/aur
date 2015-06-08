# Contributor: nblock <nblock [/at\] archlinux DOT us>

pkgname=pdfscissors
pkgver=0.0.2
pkgrel=1
pkgdesc='A tool to crop pdf files.'
url='http://www.pdfscissors.com'
depends=('java-runtime')
arch=('any')
license=('AGPL')
source=(http://sites.google.com/site/pdfscissors/${pkgname}.jar)
md5sums=('2e8ddd4daa466e02b88bd260167da873')

build() {
  mkdir -p ${pkgdir}/usr/{bin,share/${pkgname}}
  cd ${srcdir}
  install -m644 ${pkgname}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  
  #create startup file
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/pdfscissors/pdfscissors.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
