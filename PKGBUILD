# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=oauth-tty
pkgname=ruby-$_gemname
pkgver=1.0.5
pkgrel=1
pkgdesc='OAuth 1.0 TTY Command Line Interface'
arch=('any')
url='https://gitlab.com/oauth-xx/oauth-tty/'
license=('MIT')
depends=('ruby-version_gem')
makedepends=('ruby-rdoc')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('34e25c307da4509d4deec266ff3690bbf42e391355f496201c029268862d8b17')
options=(!emptydirs)

package() {

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"

  install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

}
