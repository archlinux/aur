# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://www.eclipse.org/aspectj

pkgname=aspectj
pkgver=1.9.5
pkgrel=2
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
  mkdir -p $pkgdir/opt/aspectj
  java -jar aspectj_$pkgver.jar -to $pkgdir/opt/aspectj
  sed -i "s/ ASPECTJ_HOME=.*/ ASPECTJ_HOME=\/opt\/aspectj/" $pkgdir/opt/aspectj/bin/* 
  sed -i "s/java-10-openjdk/default/" $pkgdir/opt/aspectj/bin/* 
}
