# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ruby-koala
_gemname=koala
pkgver=3.0.0
pkgrel=2
pkgdesc='A lightweight Facebook library supporting the Graph, Marketing, and Atlas APIs, realtime updates, test users, and OAuth'
arch=('any')
url='https://github.com/arsduo/koala'
license=('MIT')
depends=('ruby' 'ruby-faraday' 'ruby-addressable')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.gem::https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('9ca876db37f2cda787c18f79141ccec4293a7b203e5336dd32eb718b5ca4f6cc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" ${pkgname}-${pkgver}.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -Dm644 "${pkgdir}/usr/lib/ruby/gems/3.0.0/gems/koala-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}