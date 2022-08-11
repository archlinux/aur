# Contributor: farawayer <farwayer@gmail.com>

_gemname=tty-screen
pkgname=ruby-$_gemname
pkgver=0.8.1
pkgrel=1
pkgdesc='Terminal screen size detection which works on Linux, OS X and Windows/Cygwin platforms and supports MRI, JRuby and Rubinius interpreters.'
arch=(any)
url='http://peter-murach.github.io/tty/'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('ebc57ece9329b11498c48af6a5907457173ea79c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
