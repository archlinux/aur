# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=methadone
pkgname=ruby-$_gemname
pkgver=2.0.2
pkgrel=1
pkgdesc="Provides a lot of small but useful features for developing a command-line app."
arch=(any)
url="https://github.com/davetron5000/methadone"
license=(Apache)
depends=('ruby' 'ruby-bundler')
makedepends=(rubygems ruby-rdoc)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c730f7812477b030e502514e0291b70d6fc30feb356c51d2018800b13a289083')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --no-document \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
