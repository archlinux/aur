# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='jquery-rails'
pkgname="ruby-${_gemname_}"
pkgver='4.1.1'
pkgrel=1
pkgdesc='Provides jQuery and the jQuery-ujs driver for your Rails 4+ application'
arch=('any')
url='http://rubygems.org/gems/jquery-rails'
license=('MIT')
depends=('ruby' 'ruby-rails-dom-testing' 'ruby-railties' 'ruby-thor')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('413a5046709d4ba36742df1cd8ec15e1ba5369710739b970c283380c53ce4bab')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
