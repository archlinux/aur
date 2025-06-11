# Maintainer: envolution
# Contributor: Valantin <valantin89 [at] gmail [dot] com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=clamp
pkgname="ruby-${_gemname}"
pkgver=1.3.2
pkgrel=1
pkgdesc='a minimal framework for command-line utilities'
arch=(any)
url='http://github.com/mdub/clamp'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('4f6a99a8678d51abbf1650263a74d1ac50939edc11986271431d2e03a0d7a022')
package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
