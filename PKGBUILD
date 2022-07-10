# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=13.0.4
pkgrel=1
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

sha512sums=('2e3f2b8579a9849091415bf9ab0bb435067687ed0cad1c912710d9bb9cb7a8b1f68bf5d8e9ad053e3fd59a331476425bebbd8c05f13c849dbbe0f53a27305dd1')
