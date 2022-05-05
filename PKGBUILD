# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

_gemname=trailblazer-option
pkgname=ruby-$_gemname
pkgver=0.1.2
pkgrel=1
pkgdesc='Wrap options for runtime evaluation (e.g. for introspection, lambda or Callable patterns)'
arch=('any')
url="https://rubygems.org/gems/$_gemname"
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('20e4f12ea4e1f718c8007e7944ca21a329eee4eed9e0fa5dde6e8ad8ac4344a3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
