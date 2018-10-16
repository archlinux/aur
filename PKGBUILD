# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
#_major=11
#_build=28
#pkgver=${_major}b${_build}
pkgver=11.0.1
_major=${pkgver/.*}
_build=13
_hash=90cf5d8f270a4347a95050320eef3fb7
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
#source=("https://download.java.net/java/early_access/jdk${_major}/${_build}/BCL/jdk-${_major}+${_build}_doc-all.zip"
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
#sha256sums=('f33f2d8220d5a82e3343a412e7c761276c33d9ed7e2effa03f8ee8ae7bf0456c'
sha256sums=('6255d96128898b8dd3c65d84d9732e47d633879aff4345a5dd8d41bfffdd2199'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
