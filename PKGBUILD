# Maintainer: gryffyn <aur at evan dot me>

_gemname=zpng
pkgname=ruby-$_gemname
pkgver=0.4.5
pkgrel=1
pkgdesc="pure ruby PNG file manipulation & validation"
arch=(any)
url='https://github.com/zed-0xff/zpng'
license=(MIT)
depends=('ruby' 'ruby-rainbow')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('1c4fa7ffe392b1611cc1a0d9f880a63299da2220e36bfb4264fc68fa6e3cd977')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
