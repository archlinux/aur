# Maintainer: Bet4 <0xbet4@gmail.com>

_gemname=one_gadget
pkgname=$_gemname
pkgver=1.7.4
pkgrel=1
pkgdesc="The best tool for finding one gadget RCE in libc.so.6"
arch=(any)
url='https://github.com/david942j/one_gadget'
license=(MIT)
depends=(ruby ruby-elftools)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('e1e343a50874414e87b9c1bf49c022d3863081fe948b5f9c932be4ff674f076c')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  install -d -m 755 ${pkgdir}/usr/bin
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

