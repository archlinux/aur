# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
pkgver=0.5.4
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/$pkgname/files/jNetMap%20$pkgver/jNetMap-$pkgver.jar)
sha256sums=('d42a99918f55073736fc6c67efc0d59ec37a864cb9f6a516ff0a4a008c72ba5b')

package() {
  cd "${srcdir}"

  install -Dm644 jNetMap-$pkgver.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar

# executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/jnetmap/jnetmap.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
}
