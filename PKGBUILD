# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=airbrussh
pkgname=ruby-$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='Airbrussh pretties up your SSHKit and Capistrano output.'
arch=(any)
url='https://github.com/mattbrictson/airbrussh'
license=('MIT')
depends=(ruby ruby-sshkit)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e422d335c0165fdb2d10f714e8b816719323286b860b287fbe07b14474315b3f')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
