# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=presto-cli
pkgver=0.191
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://prestodb.io/'
license=('custom:Apache 2')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/${pkgver}/presto-cli-${pkgver}-executable.jar"
        'https://raw.githubusercontent.com/prestodb/presto/master/LICENSE')
noextract=("presto-cli-${pkgver}-executable.jar")
sha256sums=('118713be189163c14ad4d2a05f5807dbff050e016dd175f923e6683426e4d762'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
  cd "${srcdir}"

  # install in bin
  install -D -m755 "presto-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/presto"

  # add license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
