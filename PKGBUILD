# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="httpx"
pkgname="ruby-$_gemname"
pkgver=1.6.2
pkgrel=1
arch=("any")
pkgdesc="A client library for making HTTP requests from Ruby."
url="https://rubygems.org/gems/$_gemname"
license=("Apache 2.0")
depends=("ruby" "ruby-http-2")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('464ee0228e96ad1ee0affe7fd86cc87078e99a6d37c9d6884e29e87195b911d9')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
