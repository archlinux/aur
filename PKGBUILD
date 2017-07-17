# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=9
#_minor=1
_build=178
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
sha256sums=('8860780ccb8e2bfbd07d7cffb5580ee3446e44938227bbe6471c7a3327065d93'
            'a8b0ecff3221f39c53092d910dfd903ff243a185835ad6d121abbbe82225d335')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Terms.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
