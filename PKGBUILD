pkgname=netbeans-plugin-color-codes-preview
pkgver=0.13.4
pkgrel=1
pkgdesc='A NetBenas Plugin made you can get color preview of CSS'
arch=('any')
license=('Apache-2.0')
url='https://plugins.netbeans.apache.org/catalogue/?id=24'
source=("git+https://github.com/junichi11/netbeans-color-codes-preview.git#tag=v$pkgver")
depends=('netbeans>=12')
makedepends=('jdk17-openjdk' 'maven')
install='.install'

build () {
  cd "$srcdir/netbeans-color-codes-preview"
  mvn install
}

package () {
  cd "$srcdir/netbeans-color-codes-preview/target"
  mkdir -p "$pkgdir/tmp/netbeans-color-codes-preview"
  cp netbeans-color-codes-preview-$pkgver.nbm "$pkgdir/tmp/netbeans-color-codes-preview"
}