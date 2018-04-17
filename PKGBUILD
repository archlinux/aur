# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ruby-jekyll-compose
pkgver=0.8.0
pkgrel=1
pkgdesc="Streamline your writing in Jekyll with these commands"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-compose"
noextract=("jekyll-compose-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-compose-${pkgver}.gem"
        "LICENSE")
md5sums=('4918f325553ccccd2b0bb88e644b940b'
         '24cbe1f463ac66eaae650087275dab91')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-compose-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-compose-${pkgver}.gem"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
