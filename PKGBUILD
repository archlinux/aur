# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Haochen Tong <i at hexchain dot org>

_gemname_=binman
pkgname=ruby-${_gemname_}
pkgver=5.1.0
pkgrel=1
pkgdesc="Produces UNIX manual pages for executable scripts"
arch=('any')
depends=('ruby' 'ruby-opener')
makedepends=('ruby-rdoc')
url="https://github.com/sunaku/binman"
license=('ISC')
source=(https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem)
sha256sums=('767b5174a333e5f0c2f4d6346f28b9a91e8233347fe55dbb9100e558a0afc4f2')
noextract=("${pkgname#*-}-${pkgver}.gem")
options=(!emptydirs)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
