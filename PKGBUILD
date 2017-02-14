# Maintainer: Pedro Veloso <pedro.n.veloso at gmail dot com>

pkgname=jpwdhash
pkgver=0.1
pkgrel=1
pkgdesc="Command line implementation of PwdHash"
arch=('any')
url="https://github.com/pedronveloso/jPwdHash"
license=('GPL3')
depends=('java-environment')
source=("https://github.com/pedronveloso/jPwdHash/releases/download/0.1/jPwdHashFinal-all-${pkgver}.jar"
        'jpwdhash'
        'LICENSE')
sha256sums=('a1d46221c633a63a7379ba6a6b0ad941d03254344dbbf5f5c7ae307810674caa'
            '5ce82a4db8a803ec356f91b617091b87192a97f617dc9cefad2a30fc034dcd5f'
            '589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
noextract=(jPwdHashFinal-all-${pkgver}.jar)

package() {
  # Install jar
  install -Dm644 ${srcdir}/jPwdHashFinal-all-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/jpwdhash.jar

  # Install license
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install run script
  install -Dm755 ${srcdir}/jpwdhash ${pkgdir}/usr/bin/jpwdhash
}
