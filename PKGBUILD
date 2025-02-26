# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='OAuth Core Ruby implementation'
arch=('any')
url='https://github.com/oauth-xx/oauth-ruby'
license=('MIT')
depends=('ruby-oauth-tty' 'ruby-snaky_hash' 'ruby-version_gem')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('38902b7f0f5ed91e858d6353f5e1e06b2c16a8aa0fd91984671eab1a1d1cddeb')
options=(!emptydirs)

package() {

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
