_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=11.3.0
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

sha512sums=('014d20e74435cb9115157e7a6e5d185f93ad563517d4def7eff1ed8fdddd4062ae1e2b8bbd5078e4f0fc32e6abef45ba2a9765cfc68d25fa14a93c80abd104fc')
