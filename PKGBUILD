# Maintainer: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: eagletmt <eagletmt at gmail dot com>

_gemname=oauth
pkgname=ruby-$_gemname
pkgver=0.5.7
pkgrel=1
pkgdesc='OAuth Core Ruby implementation'
arch=('any')
url='https://github.com/oauth-xx/oauth-ruby'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('f11449eb08708f6c9ea7e1ee02beb9d165a885de603cbf724af9b47295653520')
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
