# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Xiang Gao <qasdfgtyuiop@gmail.com>

pkgname=ruby-jekyll-redirect-from
pkgver=0.13.0
pkgrel=1
pkgdesc='Seamlessly specify multiple redirections URLs for your pages and posts'
arch=(any)
url='https://github.com/jekyll/jekyll-redirect-from'
license=(MIT)
depends=('ruby' 'ruby-jekyll')
options=(!emptydirs)
source=("https://rubygems.org/downloads/jekyll-redirect-from-${pkgver}.gem")
noextract=("jekyll-redirect-from-${pkgver}.gem")
sha512sums=('67d8f7ff2345f1b5be7f4ad0089af4d1b60dcc9716b1be9f046ad048950eceaf6e44376310deaf67496236ae0c18578449dccac64db3080d9087565c4408ad9b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-redirect-from-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/jekyll-redirect-from-${pkgver}.gem"

  install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-redirect-from-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
