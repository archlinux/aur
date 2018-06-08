# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>

_gemname=taskwarrior-web
pkgname=ruby-$_gemname
pkgver=1.1.12
pkgrel=1
pkgdesc='Web frontend for taskwarrior command line task manager.'
arch=(any)
url='http://github.com/theunraveler/taskwarrior-web'
license=(MIT)
depends=(ruby ruby-sinatra ruby-parseconfig ruby-vegas ruby-rinku ruby-versionomy ruby-activesupport-3 ruby-sinatra-simple-navigation ruby-rack-flash3 ruby-json-1)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('644364a283175416bd0defadfffa8ab7f97694e4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
