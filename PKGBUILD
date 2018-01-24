# Maintainer Roberto Valentini <valantin89 [at] gmail [dot] com>

pkgname=occi-cli
pkgver=4.3.10
pkgrel=1
pkgdesc='This gem is a client implementation of the Open Cloud Computing Interface in Ruby'
arch=(i686 x86_64)
url='http://egi-fctf.github.io/rOCCI-cli/'
license=(Apache)
depends=('ruby>=1.9.3'
         'ruby-activesupport>=4.0.0' 'ruby-activesupport<5'
         'ruby-highline>=1.6.21' 'ruby-highline<2'
         'ruby-json>=1.8.1' 'ruby-json<3'
         'occi-api>=4.3.14' 'occi-api<5')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=($pkgname-$pkgver.gem)
sha256sums=('8d7c20c5db39a0c794be8e2f022da501b84d799dc906dc5803ff1058d7cdc6fe')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $pkgname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
