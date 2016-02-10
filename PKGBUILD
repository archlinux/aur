# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Artem Vorotnikov <artem at vorotnikov dot me>

_gemname=addressable
pkgname=ruby-$_gemname
pkgver=2.4.0
pkgrel=1
pkgdesc='URI Implementation'
arch=(any)
url='https://github.com/sporkmonger/addressable'
license=('Apache License 2.0')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7abfff765571b0a73549c9a9d2f7e143979cd0c252f7fa4c81e7102a973ef656')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
