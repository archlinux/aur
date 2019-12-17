# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://www.eclipse.org/aspectj

pkgname=aspectj
pkgver=1.9.5
pkgrel=1
pkgdesc='seamless aspect-oriented extension to the Java™ programming language'
arch=('any')
url='https://projects.eclipse.org/projects'
license=('Eclipse Public License 1.0')
depends=('jre11-openjdk')
makedepends=()
provides=()
conflicts=('aspectj-git')
source=("aspectj_$pkgver.jar::http://ftp.fau.de/eclipse/tools/aspectj/aspectj-1.9.5.jar")
sha256sums=('335820a6772587873dfdcc614a772ecbb4731b4ffb99eb8ad953cde39f9cf825')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib/jvm/java-11-openjdk
  java -jar aspectj_$pkgver.jar -to $pkgdir/usr/lib/jvm/java-11-openjdk
}
