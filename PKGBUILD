# Maintainer: Roberto Valentini <valantin89 [at] gmail [dot] com>
# Contributor: Sonic-Y3k <sonic.y3k@googlemail.com>

_gemname=httparty
pkgname=ruby-$_gemname
pkgver=0.22.0
pkgrel=1
pkgdesc="Makes http fun! Also, makes consuming restful web services dead easy."
arch=('any')
url="https://rubygems.org/gems/httparty"
license=('MIT')
depends=('ruby>=2.0.0'
         'ruby-multi_xml>=0.5.2'
         'ruby-mini_mime>=1.0.0'
)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
sha256sums=('78652a5c9471cf0093d3b2083c2295c9c8f12b44c65112f1846af2b71430fa6c')
noextract=($_gemname-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}


