# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname_="timeout"
pkgname="ruby-${_gemname_}"
pkgver=0.4.0
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

sha256sums=('cd6d1f3e83594a90ac1f3de8235399bff87112d97fec928ee2b77de240dd2cb5')
