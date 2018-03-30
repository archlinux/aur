# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Bennett Piater <bennett at piater dot name>
# Former maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='ruby-plist'
pkgver='3.4.0'
pkgrel=3
pkgdesc='A library to manipulate Property List files'
arch=('any')
url='http://plist.rubyforge.org/'
license=('MIT')
depends=('ruby')
source=('https://rubygems.org/downloads/plist-3.4.0.gem')
sha256sums=('341d1745fc3820d172c682d7faf5126a1fc786617c73f63ad6d79c9d889c47b8')


package() {
	cd "$srcdir"
        local _gemdir="$(ruby -e'puts Gem.default_dir')"
        gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "plist-${pkgver}.gem"
        rm "${pkgdir}/${_gemdir}/cache/plist-${pkgver}.gem"
        install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
        cp "${pkgdir}/${_gemdir}/gems/plist-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
