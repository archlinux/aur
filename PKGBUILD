# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=unf_ext
_pkgname=ruby-$_gemname
pkgver=0.0.7.4
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='Unicode Normalization Form support library for CRuby.'
arch=(i686 x86_64)
url='https://github.com/knu/ruby-unf_ext'
license=(MIT)
depends=('ruby')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('8b3e34ddcc5db65c6e0c9f34b5bd62720e770ba04843d601c3730c887f131992')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
