# Maintainer : Jonathan Waldrep <spartan074+aur@gmail.com>

# NOTES
# The use of mirrors is preferred.
# You can manually download the tar.gz and tar.gz.asc from:
# https://commons.apache.org/proper/commons-lang/download_lang.cgi
#
# The signing key can be obtained from:
# https://www.apache.org/dist/commons/KEYS
# Search for 5ECBB314 in that file, and use the key block directly below it.

pkgname=apache-commons-lang
_apachename=commons-lang3
pkgver=3.9
pkgrel=1
pkgdesc='Apache Commons Lang'
arch=('any')
url='https://commons.apache.org/proper/commons-lang/index.html'
license=('Apache')
depends=('java-environment')
source=(https://downloads.apache.org/commons/lang/binaries/commons-lang3-${pkgver}-bin.tar.gz{,.asc})
sha512sums=('f9c76b0848e28bd230cd034aff9f632da0548659461dcf5c7d34a7fcab15f031b6fece1f5096661336362b1a23b8bd899a2b14a32e91b2ac5fa27e4e7a489288'
            'SKIP')
validpgpkeys=('B6E73D84EA4FCC47166087253FAAD2CD5ECBB314')

package() {
  install -D -m 644 \
    ${srcdir}/${_apachename}-${pkgver}/${_apachename}-${pkgver}.jar \
    ${pkgdir}/usr/share/java/${_apachename}-${pkgver}.jar
  ln -s ${_apachename}-${pkgver}.jar ${pkgdir}/usr/share/java/${_apachename}.jar
}
