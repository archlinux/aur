# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=all-contributors-cli
pkgver=7.0.0
pkgrel=1
pkgdesc="Automate acknowledging contributors to your open source projects"
arch=('any')
url="https://allcontributors.org/cli/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('8fa01c78bdf5e1ed8b86c3db50b13c69a1066ccb8f79d4478f5d7bfcdccf76aba05cada0d55ac0ec6f2e27b20df8dc6eaa4a9bc10a62b61fdab447efb46b4bcf')

package() {
  cd "$srcdir"

  npm install \
    --global \
    --ignore-scripts \
    --prefix "$pkgdir/usr" \
    --cache npm-cache \
    "$pkgname-$pkgver.tgz"

  install -Dm 644 "$pkgdir/usr/lib/node_modules/all-contributors-cli/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
