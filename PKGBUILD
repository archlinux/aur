# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>

_gemname=iostruct
pkgname=ruby-$_gemname
pkgver=0.0.5
pkgrel=1
pkgdesc="A Struct that can read/write itself from/to IO-like objects"
arch=(any)
url='https://rubygems.org/gems/iostruct'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('80cea119eb6368a1169e8058549dbf0453e3599174a3e3961fda7e58d1b27bfc')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
