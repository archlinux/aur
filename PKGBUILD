# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-form_data
pkgname=ruby-$_gemname
pkgver=2.0.0
pkgrel=1
pkgdesc='Utility-belt to build form data request bodies.'
arch=('any')
url='https://github.com/httprb/form_data'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4c1e3dad9d4a73441aa09cc79fa59bbd18219a9c47389b30bbb4bbb15cbc8c9d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm0644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
