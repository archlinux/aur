# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=1.1.3
pkgrel=1
pkgdesc='OAuth for Ruby'
arch=('any')
url='https://github.com/oauth-xx/oauth-ruby'
license=('MIT')
depends=('ruby-base64' 'ruby-oauth-tty' 'ruby-snaky_hash' 'ruby-version_gem')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('71ca1b534561bf31a9b2aee01147384064b555e796d1a0fe2591806bb4bdd633')
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

  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

}
