# Maintainer: Inder Redni <inder@oad.earth>

pkgname=strapi
pkgver=4.2.3
pkgrel=1
pkgdesc="Open source Node.js Headless CMS to easily build customisable APIs"
arch=('any')
url="https://strapi.io"
license=('MIT')
depends=('nodejs-lts-gallium')
makedepends=('npm')
provides=('strapi')
source=("https://registry.npmjs.org/@strapi/strapi/-/$pkgname-$pkgver.tgz"
        LICENSE)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('f249ad71e2eac0a018e14f49e15d66171793e90e7782c224dd64da41a083a5ff'
            'c9291261c888edc8fd80d24d47f507033630cf4108ca9040fc640cd95a7eea79')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
