# Maintainer: robertfoster

_gemname=dry-cli
pkgname=ruby-${_gemname}
pkgver=1.0.0
pkgrel=1
pkgdesc='Common framework to build command line interfaces with Ruby'
arch=(any)
url='https://dry-rb.org/gems/dry-cli'
license=(MIT)
depends=('ruby' 'ruby-concurrent')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=(${_gemname}-${pkgver}.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('28ead169f872954dd08910eb8ead59cf86cd18b4aab321e8eeefe945749569f0')
