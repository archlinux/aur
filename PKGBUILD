# Maintainer: James An <james@jamesan.ca>

pkgname=solr6-war
pkgver=6.1.0
_pkgname="${pkgname%${pkgver:0:1}-war}"
pkgrel=1
pkgdesc='Popular, blazing fast open source enterprise search platform from the Apache Lucene project'
arch=('any')
url="http://lucene.apache.org/$_pkgname"
license=('Apache')
depends=('java-environment>=8')
makedepends=('apache-ant' 'apache-ivy')
provides=("$_pkgname=$pkgver" "$_pkgname${pkgver:0:1}=$pkgver")
install=$pkgname.install
source=("https://archive.apache.org/dist/lucene/$_pkgname/$pkgver/$_pkgname-$pkgver.tgz")
md5sums=('84bb447fb4f3a46cff3015368a8fec2e')

package() {
  cd "$_pkgname-$pkgver/server/$_pkgname-webapp/webapp"

  jar -cvf "$_pkgname-$pkgver.war" *
  install -Dm644 "$_pkgname-$pkgver.war" "$pkgdir/usr/share/java/lib/$_pkgname/$_pkgname-$pkgver.war"
}
