# Maintainer: boosterdev@linuxmail.org

_pkgname="slop"
pkgname="ruby-${_pkgname}"
pkgver=4.4.3
pkgrel=1
arch=("any")
pkgdesc="Simple Lightweight Option Parsing"
url="http://github.com/leejarvis/slop"
license=("MIT")
makedepends=("ruby")
optdepends=("ruby-minitest" "ruby-rake")
source=("https://rubygems.org/gems/${_pkgname}-${pkgver}.gem")
sha256sums=('53f6adf091a060999425e50cf94acfde4d19a921f2522b3c7bfb8da8721fa27d')
noextract=("${_pkgname}-${pkgver}.gem")

package() {
 local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
 gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "${_pkgname}-${pkgver}.gem"
}
