# Maintainer: James An <james@jamesan.ca>

_pkgname=solr
pkgver=4.10.4
pkgname="${_pkgname}${pkgver:0:1}-war"
pkgrel=1
pkgdesc='Solr / SolrCloud web application archive (WAR) ready to deploy on any Java EE container'
arch=('any')
url="http://lucene.apache.org/$_pkgname"
license=('Apache')
depends=('java-environment>=7')
provides=("$_pkgname=${pkgver:0:1}" "${_pkgname}${pkgver:0:1}=${pkgver:0:1}")
source=("http://central.maven.org/maven2/org/apache/$_pkgname/$_pkgname/$pkgver/$_pkgname-$pkgver.war")
noextract=("$(basename --multiple ${source[@]})")
md5sums=('c2bd351c295f811621afdaf971fbd392')

package() {
  install -Dm644 "$_pkgname-$pkgver.war" "$pkgdir/usr/share/java/lib/$_pkgname/$_pkgname-$pkgver.war"
}
