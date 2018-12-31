# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mwic
pkgver=0.7.7
pkgrel=1
pkgdesc='Misspelled Words In Context'
arch=('any')
url=https://github.com/jwilk/mwic
license=('MIT')
depends=('python-pyenchant' 'python-regex')
checkdepends=('aspell-en' 'python-nose')
source=("$url/releases/download/$pkgver/mwic-$pkgver.tar.gz"{,.asc})
sha512sums=('d28194fa832204552ee68a09ab2822f7380c7cbdd0d980455de2a06a973b5fd6a11d99363388f0b28c2d2256849bb03b497e039a40d6f7d79880a792f3d714f6'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5') # Jakub Wilk

check() {
  cd mwic-$pkgver
  make test
}

package() {
  cd mwic-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/mwic doc/LICENSE
}

# vim:set ts=2 sw=2 et:
