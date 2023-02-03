# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname_="timeout"
pkgname="ruby-${_gemname_}"
pkgver=0.3.1
pkgrel=1
pkgdesc="Auto-terminate potentially long-running operations in Ruby."
arch=("any")
url="https://github.com/ruby/timeout"
license=("Ruby" "BSD-2-Clause")
depends=("ruby")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")

package() {
	local _gemdir_="$(ruby -e'puts Gem.default_dir')"

	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir_}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"

	rm "${pkgdir}/${_gemdir_}/cache/${_gemname_}-${pkgver}.gem"
}

sha256sums=('eaab5f7da498d573b7b177b42ca4d23f07aadd7b5b0af6250b751077f204d052')
