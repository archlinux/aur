# Maintainer: Det <nimetonmaili g mail>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk6-docs
_major=6
_minor=30
_build=b12
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit"
arch=('any')
url='https://www.java.com/en/download/faq/java_6.xml'
license=('custom:Oracle')
options=('!strip')
optdepends=("java-environment>=$_major: Compile and run the examples")
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jdk-$pkgver-apidocs.zip"
        'LICENSE')
md5sums=('a8805b35af0d9b2aa14fe0d1212355b7'
         'fd05f7d59d6335a1e3f12706ae59dbdb')

DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

package(){
  # Docs
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
