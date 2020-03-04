# Maintainer: Bet4 <0xbet4@gmail.com>

_gemname=elftools
pkgname=ruby-$_gemname
pkgver=1.1.2
pkgrel=1
pkgdesc="ELF parser library implemented in pure Ruby"
arch=(any)
url='https://github.com/david942j/rbelftools/'
license=(MIT)
depends=(ruby ruby-bindata)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('7caf1e0535600fdb73063e8a96f440cd6fb2514ec39e82e8c4d767a934ab3f80')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

