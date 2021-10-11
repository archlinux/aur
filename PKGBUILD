# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=fog-xml
pkgname=ruby-$_gemname
pkgver=0.1.4
pkgrel=1
pkgdesc='XML parsing for fog providers'
arch=(any)
url='https://github.com/fog/fog-xml'
license=(MIT)
depends=(ruby ruby-fog-core ruby-nokogiri)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('30d026001cdb16225ab1f643475d093fe309658a87d79a69672361be6d9c76916c69bcbf8bdf380d62b4249fe39f776dc4c392cb6923c296af99efc9ae7d167b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
