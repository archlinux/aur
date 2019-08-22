# $Id$
# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=prisma
pkgver=1.34.6
pkgrel=1
pkgdesc='Prisma is a performant open-source GraphQL ORM-like layer doing the heavy lifting in your GraphQL server'
arch=('any')
url='https://prisma.io'
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('91805c9955c5814b64901a3724f9aac2a99128c8ac6e546762baa1d93c2c85516aded299f963d7dd556b4d8403ff1c4c89eca03b8b669534f27478ef1cacece6')

package() {
  npm install -g --ignore-scripts --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/prisma/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

