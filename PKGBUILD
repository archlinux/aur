# Maintainer: Det <nimetonmaili g-mail>

pkgname=javafx-devel-samples
_major=9
#_minor=1
_build=156
_pkgver=$_major
pkgver=${_major}b${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.b${_build}
pkgrel=1
pkgdesc="Demos and samples for Oracle JavaFX $_major Development Kit Snapshot"
arch=('any')
url="https://jdk$_major.java.net/"
license=('custom:Oracle BSD')
optdepends=("java-runtime>=$_major: Run the examples"
            "java-environment>=$_major: Compile and run the examples")
options=('!strip')
source=("http://www.java.net/download/java/jdk$_major/archive/$_build/binaries/javafx-${_pkgver}_linux-x86_demo.zip"
        'OTN-Early-Adopter-License-Terms.txt')
sha256sums=('151033d205e50ab8ff6e105dc25fcd0cebbbc92f87e3b04593669e7307b005c2'
            '5f00ffce28036cf79da41c7fe0e29801e3148597a164ecc69f49e718ae370370')

package() {
  # Install
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-jdk/samples/javafx/
  mv javafx-samples-$_major-ea/* "$pkgdir"/usr/lib/jvm/java-$_major-jdk/samples/javafx/

  # License
  install -Dm644 OTN-Early-Adopter-License-Terms.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
