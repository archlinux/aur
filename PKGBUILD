# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=jgnash
pkgver=2.28.3
pkgrel=1
pkgdesc="Cross platform personal finance application written in Java"
arch=('any')
url="http://sourceforge.net/projects/jgnash/"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/$pkgname/files/Active%20Stable%202.x/$pkgname-$pkgver-bin.zip)
sha256sums=('5a0f50ad9a79364ba3455b74080a7cb711124102ab1f0c680f20055f40ff041f')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  rm *.exe
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/share/java/$pkgname
  cp -r * "${pkgdir}"/usr/share/java/$pkgname

# executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/jgnash/jgnash2.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
}
