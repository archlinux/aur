# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=ruby-w3c_validators
_pkgname=w3c_validators
pkgver=1.3
pkgrel=1
pkgdesc="A Ruby wrapper for the World Wide Web Consortium's online validation services."
arch=("any")
url="http://code.dunae.ca/w3c_validators/"
license=(GPL)
depends=("ruby" "ruby-json" "ruby-nokogiri")
source=("https://rubygems.org/downloads/${_pkgname}-${pkgver}.gem")
noextract=("${_pkgname}-${pkgver}.gem")
md5sums=('2e70d68e8ef4809d6fd32b8a529860dd')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    $_pkgname-$pkgver.gem -n "$pkgdir/usr/bin"
}
