# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname_="timeout"
pkgname="ruby-${_gemname_}"
pkgver=0.4.1
pkgrel=2
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
	install -D -m644 "$pkgdir/$_gemdir_/gems/$_gemname_-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

sha256sums=('6f1f4edd4bca28cffa59501733a94215407c6960bd2107331f0280d4abdebb9a')
