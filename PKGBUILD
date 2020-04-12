# Maintainer: gryffyn <aur at evan dot me>

_gemname=iostruct
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc="A Struct that can read/write itself from/to IO-like objects"
arch=(any)
url='https://rubygems.org/gems/iostruct'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('ac3b15d4ebfc0a92a93b4c3c02a8e7997fedc33e0f715fcf1f520c1d7d36974f')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
