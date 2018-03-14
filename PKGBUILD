# Maintainer Roberto Valentini <valantin89 [at] gmail [dot] com>

_gemname=json-schema
pkgname=ruby-$_gemname
pkgver=2.8.0
pkgrel=1
pkgdesc='Ruby JSON Schema Validator'
arch=(any)
url='https://github.com/ruby-json-schema/json-schema'
license=(MIT)
depends=('ruby'
         'ruby-addressable>=2.4')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('bf7a949c1b9629097af506900668d4c463f5321b6eefed80c57599aa3c46b185')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
