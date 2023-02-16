# Maintainer: gryffyn <aur at evan dot me>

_gemname=zpng
pkgname=ruby-$_gemname
pkgver=0.4.4
pkgrel=1
pkgdesc="pure ruby PNG file manipulation & validation"
arch=(any)
url='https://github.com/zed-0xff/zpng'
license=(MIT)
depends=('ruby' 'ruby-rainbow')
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('8aa0dbf0be608c4001f925fd839627de1eca30505f4646b557b4f45f03a2f99c')

package() {
  local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
