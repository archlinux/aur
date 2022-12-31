# Maintainer: Kamil Krzyżanowski <kamnxt@kamnxt.com>

pkgname=ruby-jekyll-compose
pkgver=0.12.0
pkgrel=1
pkgdesc="Streamline your writing in Jekyll with these commands"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-compose"
noextract=("jekyll-compose-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-compose-${pkgver}.gem"
        "LICENSE")
md5sums=('92ba6d2700a40559eb8257e5fb5bcd86'
         '24cbe1f463ac66eaae650087275dab91')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-compose-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-compose-${pkgver}.gem"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
