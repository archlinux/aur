# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=http-cookie
_pkgname=ruby-$_gemname
pkgver=1.0.3
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='HTTP::Cookie is a Ruby library to handle HTTP Cookies based on RFC 6265.'
arch=(i686 x86_64)
url='https://github.com/sparklemotion/http-cookie'
license=(MIT)
depends=('ruby'
         'ruby-domain_name>0.5')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('2f11269d817bc52ab2af2721e89a377660a961078de2a3a55fc696d7897e8c00')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
