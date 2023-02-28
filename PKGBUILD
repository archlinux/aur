# Maintainer: Roberto Valentini <valantin89 [at] gmail [dot] com>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_gemname=httparty
pkgname=ruby-$_gemname
pkgver=0.21.0
pkgrel=1
pkgdesc="Makes http fun! Also, makes consuming restful web services dead easy."
arch=('any')
url="https://rubygems.org/gems/httparty"
license=('MIT')
depends=('ruby>=2.0.0'
         'ruby-multi_xml>=0.5.2')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('00ef7bf9a71f30a3bff88edeb5b16a34bea883ab67c246b3f0db2d6794fe1214')
noextract=($_gemname-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}


