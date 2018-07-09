# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=ruby-jekyll-redirect-from
pkgver=0.14.0
pkgrel=1
pkgdesc='Seamlessly specify multiple redirections URLs for your pages and posts'
arch=(any)
url='https://github.com/jekyll/jekyll-redirect-from'
license=(MIT)
depends=('ruby' 'ruby-jekyll')
options=(!emptydirs)
source=("https://rubygems.org/downloads/jekyll-redirect-from-${pkgver}.gem")
noextract=("jekyll-redirect-from-${pkgver}.gem")
sha512sums=('ae60139e346e6a0379d3da2f9da877e72bb86ddc716f6ae0c825ebf01b508d893004ac900dd552bbe33b6a4e06e7a0d4e2f4b77ed0c5c946b5dc499cbfb72ca9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-redirect-from-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/jekyll-redirect-from-${pkgver}.gem"

  install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-redirect-from-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
