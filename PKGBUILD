# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-devel-docs
_major=${pkgver/.*}
_build=9
_hash=ab2da78f32ed489abb3ff52fd0a02b1c
#pkgver=${_major}b${_build}
pkgver=11.0.11
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit Snapshot"
arch=('any')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
source=("https://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('ab72172df368ca1a1b6cabad94601fb12f829722f43a12f2fac062888195a61a'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


#Current link:
#https://download.oracle.com/otn-pub/java/jdk/11.0.11+9/ab2da78f32ed489abb3ff52fd0a02b1c/jdk-11.0.11_doc-all.zip
