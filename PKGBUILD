# Maintainer: Det <nimetonmaili g-mail>

pkgname=jdk-docs
pkgver=11
_major=${pkgver/.*}
_build=28
_hash=55eed80b163941c8885ad9298e6d786a
pkgrel=1
pkgdesc="Documentation for Oracle Java Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/jdk-${pkgver}_doc-all.zip"
        'LICENSE-Oracle-Legal-Notices.txt')
sha256sums=('97324a58359883a57e5352983b06ab1deedf945df77ad1275afa9795e56c2048'
            'f1c7b95bafa96ddb992e9ef7548e25c49aa98195e4ea37f3d46a93b85d8c9dbd')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  # Install
  install -d "$pkgdir"/usr/share/doc/java$_major/
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
