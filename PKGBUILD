# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=bcel
pkgname=java-${_libname}
pkgver=6.2
pkgrel=2
pkgdesc="Java library to analyze, create, and manipulate (binary) Java class files"
arch=('any')
url='https://commons.apache.org/proper/commons-bcel/'
license=('APACHE')
depends=('java-runtime-headless')
makedepends=('apache-ant' 'junit')
source=(https://archive.apache.org/dist/commons/bcel/binaries/bcel-$pkgver-bin.tar.gz{,.asc})
validpgpkeys=('CD5464315F0B98C77E6E8ECD9DAADC1C9FCC82D0'  # Benedikt Ritter (CODE SIGNING KEY)
              '2DB4F1EF0FA761ECC4EA935C86FDC7E2A11262CB') # Gary David Gregory (Code signing key) <ggregory@apache.org>
sha256sums=('e5963ed50ef1f243f852a27efaf898c050a3b39721d147ccda8418c0b7255955'
            'SKIP')

package() {
  install -D -m 644 ${_libname}-${pkgver}/${_libname}-${pkgver}.jar \
    -t "${pkgdir}"/usr/share/java
  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
}
