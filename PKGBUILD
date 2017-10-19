# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=10
_build=27
pkgver=${_major}b${_build}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('2045045310e8460a2541a3da0953848c0a7533fd9b14cebf380ef3bc9adc6b49'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
