# Maintainer: Roberto Valentini <valantin89 [at] gmail [dot] com>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_gemname=httparty
pkgname=ruby-$_gemname
pkgver=0.16.2
pkgrel=1
pkgdesc="Makes http fun! Also, makes consuming restful web services dead easy."
arch=('any')
url="https://rubygems.org/gems/httparty"
license=('MIT')
depends=('ruby>=2.0.0'
         'ruby-multi_xml>=0.5.2')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('fc67e5ba443b5ca822c2babccd3c6ed8bcc75fb67432b99652cb95972d204cff')
noextract=($_gemname-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}


