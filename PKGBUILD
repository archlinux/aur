# Maintainer: Nikita Volodin <volodin.n at gmail dot com>

pkgname=keycloak
pkgver=3.2.0
pkgrel=1
pkgdesc="Open Source Identity and Access Management For Modern Applications and Services"
arch=('any')
url="http://www.keycloak.org/"
license=('Apache')
depends=('jdk8-openjdk')
source=(
  "https://downloads.jboss.org/keycloak/$pkgver.Final/keycloak-$pkgver.Final.tar.gz"
  "keycloak.service")
md5sums=(
  '98ef9ab25f888030009218c39422850c'
  '22aba60bbc3811d5a02148c69fe67630')

package() {
   install -Dm644 keycloak.service $pkgdir/usr/lib/systemd/system/keycloak.service

   mkdir -p "$pkgdir/opt"
   cp -a "keycloak-$pkgver.Final" "$pkgdir/opt/"
   mv "$pkgdir/opt/keycloak-$pkgver.Final" "$pkgdir/opt/keycloak"
}
