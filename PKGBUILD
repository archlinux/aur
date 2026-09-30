# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

_gemname=jekyll-redirect-from
pkgname=ruby-${_gemname}
pkgver=0.17.0
pkgrel=1
pkgdesc="Seamlessly specify multiple redirections URLs for your pages and posts"
arch=('any')
url="https://github.com/jekyll/jekyll-redirect-from"
license=('MIT')
depends=('ruby' 'jekyll')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('35db55fe0546f80022577fe3cd485c81bb3c9c1398a610675a115895ac949c148c9797fb6918deff17f9c642af3ed8aecc7ed69148d7784cf472bc438626bb2e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
