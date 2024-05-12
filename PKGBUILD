# Maintainer: brauliobo <brauliobo at gmail dot com>

gemname=ruby-livesync
pkgname=ruby-livesync
pkgver=1.0.0.beta1
pkgrel=1
pkgdesc='Live sync solution using ssh + rsync'
url=https://github.com/brauliobo/ruby-livesync
license=(GPL-3.0-only)
arch=('any')
depends=(
  ruby
  ruby-activesupport
  ruby-rb-inotify
  ruby-pry
)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('5fcf2d3917f085eb2d818db30ac399a659a3c4332d9dd2f7cfdad092ebe2d7d2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname}-${pkgver}.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname}-${pkgver}.gem"
}

