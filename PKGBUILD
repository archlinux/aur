# Maintainer: gryffyn <aur at evan dot me>

_gemname=zpng
pkgname=ruby-$_gemname
pkgver=0.4.3
pkgrel=1
pkgdesc="pure ruby PNG file manipulation & validation"
arch=(any)
url='https://github.com/zed-0xff/zpng'
license=(MIT)
depends=('ruby' 'ruby-rainbow')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('1216d4df982a6978365c73d459228fd73e647945325a7369763b22b206cf1292')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
