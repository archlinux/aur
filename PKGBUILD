# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: Joel Goguen <contact+aur@jgoguen.ca>

_gemname=io-like
pkgname=ruby-$_gemname
pkgver=0.3.1
pkgrel=1
pkgdesc="IO::Like provided unbuffered read, write, and seek"
arch=('any')
depends=('ruby')
url="https://rubygems.org/gems/$_gemname"
noextract=($_gemname-$pkgver.gem)
license=('custom')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('baae0724d18bea74ab0aa693f9477a983ac2fdf3bf40c1cc4c69568d302a8306')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
