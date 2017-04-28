# Maintainer: Det <nimetonmaili g-mail>

pkgname=('jdk-devel-docs' 'javafx-devel-docs')
_major=9
#_minor=1
_build=167
_pkgver=$_major
pkgver=${_major}b${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.b${_build}
pkgrel=1
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle BSD')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://www.java.net/download/java/jdk${_major}/archive/${_build}/binaries/jdk-${_pkgver}_doc-api-spec.tar.gz"
        "http://www.java.net/download/java/jdk${_major}/archive/${_build}/binaries/javafx-${_pkgver}_doc.zip"
        'LICENSE')
sha256sums=('05e08aa4190e3fdf3a89038ee45e0c8d8935667c497322ced8b4794e6748de3b'
            '07955c958997a917da865ff0e2bf4cd904f03672c3cfd626c35317b53fdf02bc'
            '5f00ffce28036cf79da41c7fe0e29801e3148597a164ecc69f49e718ae370370')

package_jdk-devel-docs() {
  pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"

  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_javafx-devel-docs() {
  pkgdesc="Documentation for Oracle JavaFX $_major Development Kit Snapshot"

  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv api "$pkgdir"/usr/share/doc/java$_major/javafx/

  # License
  install -d "$pkgdir"/usr/share/licenses/
  ln -s /usr/share/licenses/jdk-devel-docs/ "$pkgdir"/usr/share/licenses/$pkgname
}
