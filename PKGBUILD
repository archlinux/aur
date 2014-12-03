# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
pkgver=0.5.3
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/$pkgname/files/jNetMap%20$pkgver/jNetMap-$pkgver.jar)
sha256sums=('67a21c7fa3d82ca3c153587ab7187a0dcaac4f99344c796fab1e188ba58599c0')

package() {
  cd "${srcdir}"

  install -Dm644 jNetMap-$pkgver.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar

# executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/jnetmap/jnetmap.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
}
