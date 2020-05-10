# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Ankit R Gadiya <arch@argp.in>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

_gemname=jekyll-redirect-from
pkgname=ruby-${_gemname}
pkgver=0.16.0
pkgrel=1
pkgdesc="Seamlessly specify multiple redirections URLs for your pages and posts"
arch=('any')
url="https://github.com/jekyll/jekyll-redirect-from"
license=('MIT')
depends=('ruby' 'ruby-jekyll')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('abe5affbdf16d1ac9f03e7c9642349143a73cefaab5e96c4272104b8cfae05d6eb1a5cd3cee8b7781a16f46d5613f80a1b148afb66dd2ddb40d5038aa66d9924')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
