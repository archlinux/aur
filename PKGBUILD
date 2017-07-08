# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=9
#_minor=1
_build=177
_pkgver=$_major
pkgver=${_major}b${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.b${_build}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom')
optdepends=("java-environment>=$_major: Compile and run examples")
options=('!strip')
source=("http://download.java.net/java/jdk${_major}/archive/${_build}/binaries/jdk-${_pkgver}_doc-api-spec.tar.gz"
        'LICENSE-Early-Adopter-Terms.txt')
sha256sums=('05e7e4754dc5b320226645d3f44f5c242b8cf72def67a2c4b67bcbb41f51e57f'
            'a8b0ecff3221f39c53092d910dfd903ff243a185835ad6d121abbbe82225d335')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Terms.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
