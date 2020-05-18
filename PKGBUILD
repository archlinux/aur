# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=htmlhint
pkgver=0.13.0
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('3377013c3391ccf847fd47ea6b77f4ffb389ca58e6511bb9fdb042f3f8cc9a0a52e809adb8dd81f1b416af7c3fd386c3d11c1c25955a8237f0c6b80be6c67476')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE.md usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
