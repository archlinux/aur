# Maintainer Roberto Valentini <valantin89 [at] gmail [dot] com>

pkgname=occi-api
pkgver=4.3.15
pkgrel=1
pkgdesc='This gem provides ready-to-use client classes to simplify the integration of OCCI into your application'
arch=(i686 x86_64)
url='http://egi-fctf.github.io/rOCCI-api/'
license=(Apache)
depends=('ruby>=1.9.3'
         'ruby-httparty>=0.13.1' 'ruby-httparty<1'
         'ruby-json>=1.8.1' 'ruby-json<3'
         'occi-core>=4.3.6' 'occi-core<5')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=($pkgname-$pkgver.gem)
sha256sums=('1611fc08076e41c35b0d9769eebd589dbeab3e3b502637946aba326110532a8f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $pkgname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
