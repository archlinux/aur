# Maintainer: Inder Redni <inder@oad.earth>

pkgname=strapi
pkgver=3.0.0.alpha.11
_pkgver=3.0.0-alpha.11
pkgrel=1
pkgdesc="Content Management Framework (headless-CMS) to build powerful API with no effort"
arch=('any')
url="https://strapi.io"
license=('MIT')
depends=('nodejs' 'mongodb')
makedepends=('npm')
provides=('strapi')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz"
        LICENSE)
noextract=($pkgname-$_pkgver.tgz)
sha512sums=('9acda878ac90be2bc1bea45e37bf4dde7cde65867f280fe2ac296645d29152b588ae9431882f1b6912f2ca105dd6c9eaee43faa296f3e89eca40063599be0e81'
            '07d628c82c22ce8da740a34ad487a20972c51195180ac4cfc957f1367dd1a2b1b7d5e0d93cbaed054f3f279d0ec2e9d837301c84122dff0b9a7903e124906fde')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$_pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
