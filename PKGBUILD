# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=mjml
pkgname=nodejs-$_npmname
pkgver=4.3.1
pkgrel=1
pkgdesc="The only framework that makes responsive-email easy."
arch=('any')
url="https://mjml.io/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        https://raw.githubusercontent.com/mjmlio/mjml/master/LICENSE.md)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('df8a6f141369cbccb6ab4d529db1fa8516d6682f0a6f5230d05ff47afd196f55'
            '0c4f37a6b1d7fdc8e2abb11cf49ba9dfe8128a4242861930d810f01f00ca4c49')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
