# Maintainer Roberto Valentini <valantin89 [at] gmail [dot] com>

pkgname=occi-core
pkgver=4.3.6
pkgrel=1
pkgdesc='OCCI is a collection of classes to simplify the implementation of the Open Cloud Computing API in Ruby'
arch=(i686 x86_64)
url='http://egi-fctf.github.io/rOCCI-core/'
license=(Apache)
depends=('ruby>=1.9.3'
         'ruby-activesupport>=4.0.0' 'ruby-activesupport<6'
         'ruby-hashie>=3.3.1' 'ruby-hashie<3.5'
         'ruby-json>=1.8.1' 'ruby-json<3'
         'ruby-settingslogic>=2.0.9' 'ruby-settingslogic<3'
         'ruby-uuidtools>=2.1.3' 'ruby-uuidtools<3')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=($pkgname-$pkgver.gem)
sha256sums=('fa49dbbfd479a2ff403dd5a3eb7c5793f0a62a27dd4b6e8e8f162373f00087b8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $pkgname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
