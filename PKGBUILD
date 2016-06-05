# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_gemname=xmpp4r
pkgname=ruby-$_gemname
pkgver=0.5.6
pkgrel=1
pkgdesc='XMPP/Jabber library for ruby'
arch=('any')
url='https://github.com/xmpp4r/xmpp4r'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('5689059e1781193d30c3696ed5950f83f34e7717')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
