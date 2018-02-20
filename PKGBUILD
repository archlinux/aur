# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=10
_build=44
pkgver=${_major}b${_build}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("https://download.java.net/java/jdk${_major}/archive/${_build}/BCL/jdk-${_major}+${_build}_doc-all.zip"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('e7428531a7f4f7d0755eeae97f5d41958796f37d551bf31013e37f762fecb9e4'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
