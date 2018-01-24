# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=settingslogic
pkgname=ruby-$_gemname
pkgver=2.0.9
pkgrel=1
pkgdesc='A simple and straightforward settings solution that uses an ERB enabled YAML file and a singleton design pattern.'
arch=(i686 x86_64)
url='https://github.com/binarylogic/settingslogic'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('5925a91d0d48dfb59a6e48ae2bb9c9b801fe6fab25a8e8d302ce8699d92f2ae6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
