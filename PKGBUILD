# Maintainer: farwayer <farwayer@gmail.com>

_gemname=digest-crc
pkgname=ruby-${_gemname}
pkgver=0.4.1
pkgrel=2
pkgdesc="Adds support for calculating Cyclic Redundancy Check (CRC) to the Digest module."
arch=('any')
depends=(ruby)
url="https://rubygems.org/gems/${_gemname}"
noextract=($_gemname-$pkgver.gem)
options=(!emptydirs)
license=('MIT')
source=(
  "https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
)
sha256sums=('1494ee18bbb84a61828afe09616dc22c2b73a492b50b0f79334a85321db80823')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
