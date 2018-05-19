# $Id$
# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=prisma
pkgver=1.8.3
pkgrel=1
pkgdesc='Prisma is a performant open-source GraphQL ORM-like layer doing the heavy lifting in your GraphQL server'
arch=('any')
url='https://prisma.io'
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('fcaf7e9f451374b9f783000f59e0b60dfe263ed0825180d74b9f2f9fef023cfe0bef6cca32dfdf1d40effd4e8f9c4158bce8e61c30c70f9070bcafe3fc0b3138')

package() {
  npm install -g --ignore-scripts --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/prisma/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

