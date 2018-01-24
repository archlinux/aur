# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=domain_name
_pkgname=ruby-$_gemname
pkgver=0.5.20170404
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='This is a Domain Name manipulation library for Ruby. It can also be used for cookie domain validation based on the Public Suffix List.'
arch=(i686 x86_64)
url='https://github.com/knu/ruby-domain_name'
license=(BSD)
depends=('ruby'
         'ruby-unf>=0.0.5' 'ruby-unf<1.0.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('6e8e5cf80b9fdfae3ef730e73a30bce5da0a1e4a70f6e0a0b8672a28a3471a8a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
