# Maintainer: farawayer <farwayer@gmail.com>

_gemname=google-api-client
pkgname=ruby-$_gemname
pkgver=0.23.9
pkgrel=2
pkgdesc='Client for accessing Google APIs'
arch=(any)
url='https://github.com/google/google-api-ruby-client'
license=('Apache 2.0')
depends=(
  ruby
  'ruby-addressable>=2.5.1' 'ruby-addressable<3'
  'ruby-googleauth>=0.5' 'ruby-googleauth<0.7'
  'ruby-httpclient>=2.8.1' 'ruby-httpclient<3'
  'ruby-mime-types>=3' 'ruby-mime-types<4'
  'ruby-representable>=3' 'ruby-representable<4'
  'ruby-retriable>=2' 'ruby-retriable<4'
  'ruby-signet>=0.9' 'ruby-signet<1'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('031b9ec2162a3ea06ba9e3aa7bb2a5cdc4ebffba')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
