# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=gyoku
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc='Gyoku translates Ruby Hashes to XML'
arch=(any)
url='https://github.com/savonrb/gyoku'
license=(MIT)
depends=('ruby' 'ruby-builder>=2.1.2' 'ruby-rexml')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('12ebab28273346842d13060386db7d96c71224a4f562f2a4a496ea5dbd2341cdf8850148d6cb37ffb193724f428d82e4978e79de97d4e5205c8d346d69df4745')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
