# Maintainer: Ista Zahn <istazahn@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Source: http://junolab.org
pkgname=juno
pkgver=1.0.2
pkgrel=1
pkgdesc="IDE for Julia based on lighttable"
arch=('i686' 'x86_64')
url="http://junolab.org"
license=("GPL")
depends=("nss" "alsa-lib" "desktop-file-utils" "gconf" "gtk2")
optdepends=("julia: If not using the bundled one")
conflicts=(${pkgname}-git)
install=juno.install
source_i686=("https://junolab.s3.amazonaws.com/release/${pkgver}/juno-linux-x32.zip")
source_x86_64=("https://junolab.s3.amazonaws.com/release/${pkgver}/juno-linux-x64.zip")
md5sums_i686=('0f5d11be0af9609297e8c1ae20fc2313')
md5sums_x86_64=('4217aa28b3c11c5c7eaabc2f1368e3fa')

package() {
  mkdir ${pkgdir}/opt/
  cp -R ${srcdir}/juno-linux?? "${pkgdir}/opt/juno"

  # Cosmetic changes
  cd "${pkgdir}/opt/${pkgname}"
  install -m755 Juno juno
  rm Juno
}
