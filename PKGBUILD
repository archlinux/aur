# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=awesome_print
_pkgname=ruby-$_gemname
pkgver=1.8.0
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins.'
arch=(i686 x86_64)
url='https://github.com/awesome-print/awesome_print'
license=(MIT)
depends=('ruby')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('50b0cab61afe582bc675202dc8f6745b97aae7fefe29d06a91a669d763805991')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
