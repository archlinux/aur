# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: farawayer <farwayer@gmail.com>

_gemname=jwt
pkgname=ruby-${_gemname}
pkgver=2.2.2
pkgrel=1
pkgdesc='JSON Web Token implementation in Ruby'
arch=('x86_64')
url='https://github.com/jwt/ruby-jwt'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
makedepends=('ruby-rake')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem"
        "LICENSE")
sha256sums=('56a47115e514b9cfba93b8067332462a74ecbcea843a0784bc7a208203f6d693'
            'b9f95c496bd9dba93a2b6ee6382f4692918e8648f2d9dab03e93457f8b71ac4c')

package() {
  cd "${srcdir}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

