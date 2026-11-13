# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=all-contributors-cli
pkgver=7.0.2
pkgrel=1
pkgdesc="Automate acknowledging contributors to your open source projects"
arch=('any')
url="https://allcontributors.org/cli/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('0e3f599867236da733fc9af51a0092673959ec316a3d9b9e995c7ebd03bee1a9cfa1d1f45c2041c8fc5f057925d1445638d8535a57b4bd45ec9ff015d288ca9c')

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
