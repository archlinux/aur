# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=gitbucket
pkgver=4.3
pkgrel=1
pkgdesc="The easily installable Github clone written with Scala"
url="https://github.com/gitbucket/gitbucket"
arch=( 'any' )
license=( "Apache" )
depends=( "java-runtime"  )
makedepends=( )
source=( "$pkgname-$pkgver.war::https://github.com/gitbucket/gitbucket/releases/download/$pkgver/gitbucket.war"
         "$pkgname.service" )
sha1sums=('fa3c02d9ad199a1af419ce5df18a5dcf9da6853e'
          'c93c600608d7922f67f4a3036a944fefc48bf9e0')

package() {
  install -Dm644 "$srcdir"/$pkgname-$pkgver.war "$pkgdir"/usr/share/java/$pkgname.war
  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
