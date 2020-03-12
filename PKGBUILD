# Maintainer: Michał Przybyś <michal@przybys.eu>
_gemname=jekyll-theme-leap-day
pkgname="ruby-${_gemname}"
pkgver=0.1.1
pkgrel=2
pkgdesc='Leap Day is a Jekyll theme for GitHub Pages'
arch=(any)
url='https://github.com/pages-themes/leap-day'
license=(CC0)
depends=(ruby
    jekyll
    ruby-jekyll-seo-tag)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha1sums=(68eac35495c0a0fd6ed11f28d8309aaa16d4bf65)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
