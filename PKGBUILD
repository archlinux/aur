# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ruby-plist
pkgver=3.6.0
pkgrel=1
pkgdesc='A library to manipulate Property List files'
arch=('any')
url='https://rubygems.org/gems/plist'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
source=("https://rubygems.org/downloads/plist-${pkgver}.gem")
sha256sums=('f468bcf6b72ec6d1585ed6744eb4817c1932a5bf91895ed056e69b7f12ca10f2')

package() {
	cd "$srcdir"
        local _gemdir="$(ruby -e'puts Gem.default_dir')"
        gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "plist-${pkgver}.gem"
        rm "${pkgdir}/${_gemdir}/cache/plist-${pkgver}.gem"
        install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
        cp "${pkgdir}/${_gemdir}/gems/plist-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
