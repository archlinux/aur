# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Robin Choudhury <rchoudhu@calpoly.edu>

pkgname=rst2html5
pkgver=0.5.1
pkgrel=2
pkgdesc="Transform restructuredtext documents to html5 + twitter's bootstrap css, deck.js or reveal.js"
arch=('any')
url=https://marianoguerra.github.com/rst2html5
license=('MIT')
depends=('python' 'python-docutils' 'python-setuptools')
source=("rst2html5-$pkgver.zip::https://github.com/marianoguerra/rst2html5/archive/f0574a7c8e93cb67bd36c8875749c58037ac691d.zip")
sha512sums=('ca3c49c932fe8aa622a037f56b208b78a1530f55d1d5ca40bd0d385437f1bdff8c198042956c1cc1a2ea102f4ef7fb04f63142a43acc46f696aaa11bd61d6553')

package() {
  local tmp=${source##*/}
  cd $pkgname-${tmp%\.*}
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir"/usr/bin/rst2html5{,-mg}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
