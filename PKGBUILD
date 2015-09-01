# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgname=ruby-vpim
pkgver=13.11.11
pkgrel=2
pkgdesc='This is a pure-ruby library for decoding and encoding vCard and iCalendar data ("personal information").'
arch=('any')
url='https://github.com/sam-github/vpim'
license=('Ruby')
depends=()
optdepends=()
options=('!emptydirs')
source=("http://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem")
noextract=("${pkgname#*-}-${pkgver}.gem")
sha256sums=('482067c9bb20c516933764d295a6026ffacbe6098ae88301a768d364cc135efd')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -N -i "${pkgdir}"/${_gemdir} ${pkgname#*-}-${pkgver}.gem
  find "${pkgdir}" -type f -name *.gem -delete
}

