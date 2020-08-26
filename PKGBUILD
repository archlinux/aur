# Maintainer: Bet4 <0xbet4@gmail.com>

_gemname=elftools
pkgname=ruby-$_gemname
pkgver=1.1.3
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
sha256sums=('d17c7483c221397fbae144c82d905b739152c0281f51df7dda4e8faf89e4265d')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

