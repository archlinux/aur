# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=httparty
_pkgname=ruby-$_gemname
pkgver=0.15.6
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='Makes http fun! Also, makes consuming restful web services dead easy.'
arch=(i686 x86_64)
url='https://johnnunemaker.com/httparty/'
license=(MIT)
depends=('ruby>=2.0.0'
         'ruby-multi_xml>=0.5.2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('fbe0cde25a5325a4e248d4225640529552e6b49622289bdc7110fe294f5f7e2a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
