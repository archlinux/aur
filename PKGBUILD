# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-standard
pkgver=20.0.0
pkgrel=3
pkgdesc='Standard shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-standard
license=('MIT')
depends=('nodejs' 'stylelint')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('201da215dcce4c0ff34b88d255abfacfec06b629f4f2a7e3f98c84c470772c5f659e8b9086dfff632074299abd806cf91cd3e475d1cecdc63c1ec51ecba65494')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  # License not yet added to repo
  #mkdir -p usr/share/licenses/$pkgname
  #mv usr/lib/node_modules/$pkgname/LICENSE usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
