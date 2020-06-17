# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=telosys-cli
pkgver=3.2.2
pkgrel=1
pkgdesc="Allows the use of all the features of the Telosys Core generator with a simple command line tool"
arch=('any')
url='http://www.telosys.org'
license=('LGPL3')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.tar.gz::http://www.telosys.org/download/telosys-cli/telosys-cli-${pkgver}-001.zip")
sha256sums=('f6918915d00cb02c5b806363f574cb7506ed8d7899063326789227c2b72a44c0')

package() {
  echo "#!/usr/bin/env bash
  java -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
  " > "${pkgname}.sh"
  install -Dm755 telosys*.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  install -Dm755 telosys-cli.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 telosys-cli.cfg -t "${pkgdir}/etc/${pkgname}"
}