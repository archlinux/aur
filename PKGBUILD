# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=methadone
pkgname=ruby-$_gemname
pkgver=1.8.0
pkgrel=2
pkgdesc="Provides a lot of small but useful features for developing a command-line app."
arch=(any)
url="https://github.com/davetron5000/methadone"
license=('apache')
depends=('ruby' 'ruby-bundler')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('739350d8ff576303861ce4f0955273ad16c5055afad0d868c352eed116ac2a70')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
