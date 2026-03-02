# Maintainer: gryffyn <aur at evan dot me>

_gemname=zpng
pkgname=ruby-$_gemname
pkgver=0.4.6
pkgrel=1
pkgdesc="pure ruby PNG file manipulation & validation"
arch=(any)
url='https://github.com/zed-0xff/zpng'
license=(MIT)
depends=('ruby' 'ruby-rainbow')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('40f4629f7dac4864662fa5cdfe7b410cc4bc8e72e271d39551f084291e64246e')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
