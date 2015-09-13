# Maintainer: Det <nimetonmaili g-mail>

pkgname=javafx-devel-samples
_major=9
#_minor=1
_build=b81
_date_fx=08_sep_2015
_pkgver=$_major
pkgver=${_major}${_build}
#_pkgver=${_major}u${_minor}
#pkgver=${_major}u${_minor}.${_build}
pkgrel=1
pkgdesc="Demos and samples for JavaFX"
arch=('any')
url="https://jdk$_major.java.net/"
license=('custom:Oracle BSD')
optdepends=("java-runtime>=$_major: Run the examples"
            "java-environment>=$_major: Compile and run the examples from source")
options=('!strip')
source=("http://download.java.net/jdk$_major/archive/$_build/binaries/javafx_samples-$_pkgver-ea-$_build-linux-$_date_fx.zip"
        'OTN-Early-Adopter-License-Terms.txt')
md5sums=('cfe30b6f09307161ee6acc8adf97cc92'
         'f09947a67691a2d78d20a3885889981c')

package() {
  # Install
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-jdk/samples/javafx/
  mv javafx-samples-$_major-ea/* "$pkgdir"/usr/lib/jvm/java-$_major-jdk/samples/javafx/

  # License
  install -Dm644 OTN-Early-Adopter-License-Terms.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
