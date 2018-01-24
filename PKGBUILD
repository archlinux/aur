# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=unf
_pkgname=ruby-$_gemname
pkgver=0.1.4
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='This is a wrapper library to bring Unicode Normalization Form support to Ruby/JRuby.'
arch=(i686 x86_64)
url='https://github.com/knu/ruby-unf'
license=(BSD)
depends=('ruby'
         'ruby-unf_ext')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('4999517a531f2a955750f8831941891f6158498ec9b6cb1c81ce89388e63022e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
