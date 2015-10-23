# Maintainer: 2GMon <2gmon.t@gmail.com>

_gemname=delayer-deferred
pkgname=ruby-$_gemname
pkgver=1.0.3
pkgrel=1
pkgdesc='Deferred for Delayer'
arch=(any)
url=''
license=(MIT)
depends=(ruby 'ruby-delayer>=0.0.2' 'ruby-delayer<0.1')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('286cfa0ea981c093ce6a9c120fbf3ab580973b5b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
