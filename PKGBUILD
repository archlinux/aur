# Maintainer: Michael J. Pento <mjpento@verizon.net>

pkgname=ruby-plist
pkgver=3.5.0
pkgrel=1
pkgdesc='A library to manipulate Property List files'
arch=('any')
url='https://rubygems.org/gems/plist'
license=('MIT')
depends=('ruby' 'ruby-rdoc')
source=("https://rubygems.org/downloads/plist-${pkgver}.gem")
sha256sums=('d7b9047568c80e7f1e1faa95c53f6e70023cf235e345105bd50eaede41484065')

package() {
	cd "$srcdir"
        local _gemdir="$(ruby -e'puts Gem.default_dir')"
        gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "plist-${pkgver}.gem"
        rm "${pkgdir}/${_gemdir}/cache/plist-${pkgver}.gem"
        install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
        cp "${pkgdir}/${_gemdir}/gems/plist-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
