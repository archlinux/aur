# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='ruby-plist'
pkgver='3.2.0'
pkgrel=1
pkgdesc='A library to manipulate Property List files'
arch=('any')
url='http://plist.rubyforge.org/'
license=('MIT')
depends=('ruby')
source=('https://rubygems.org/downloads/plist-3.2.0.gem')
sha256sums=('0b3dd455bde18ba7b954ff2fea4eae733f3b38b71504e723255bccc6567a70a9')


package() {
        local _gemdir="$(ruby -e'puts Gem.default_dir')"
        gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "plist-${pkgver}.gem"
        rm "${pkgdir}/${_gemdir}/cache/plist-${pkgver}.gem"
        install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}/"
        cp "${pkgdir}/${_gemdir}/gems/plist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
