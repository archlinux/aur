# Maintainer: farawayer <farwayer@gmail.com>

_gemname=faraday
pkgname=ruby-$_gemname-fastlane
pkgver=0.17.1
pkgrel=1
pkgdesc='HTTP/REST API client library.'
arch=(any)
url='https://lostisland.github.io/faraday'
license=(MIT)
depends=(
  ruby
  'ruby-multipart-post>=1.2' 'ruby-multipart-post<3'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('2fe4c94cc0bf270ccb8e4632f6250bf65a96e7ca')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
