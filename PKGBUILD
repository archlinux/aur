# Maintainer: Inder Redni <inder@oad.earth>

pkgname=strapi
pkgver=3.0.0.alpha.11.2
_pkgver=3.0.0-alpha.11.2
pkgrel=2
pkgdesc="Content Management Framework (headless-CMS) to build powerful API with no effort"
arch=('any')
url="https://strapi.io"
license=('MIT')
depends=('nodejs>=9.0.0' 'mongodb>=3.4.0')
makedepends=('npm>=5.0.0')
provides=('strapi')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz"
        LICENSE)
noextract=($pkgname-$_pkgver.tgz)
sha512sums=('853c866cec80e137eea9e8a09921205eb5d9bc49360d63ed6d5811b40e1421327fd7ca771d83ab9dc2643aad25a7a47ea94fdabf4d8ff2f572c7c92f04652ebe'
            '07d628c82c22ce8da740a34ad487a20972c51195180ac4cfc957f1367dd1a2b1b7d5e0d93cbaed054f3f279d0ec2e9d837301c84122dff0b9a7903e124906fde')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$_pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
