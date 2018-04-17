# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ruby-jekyll-archives
pkgver=2.1.1
pkgrel=1
pkgdesc="Archive pages for your Jekyll tags and categories"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-archives"
noextract=("jekyll-archives-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-archives-${pkgver}.gem"
        "LICENSE")
sha256sums=('63adf4b1be9368bad228c54a1ff5575da942d10e877bf894a186281699bd4297'
            '8db06aaffeac5a8a079786196d07839a0e04d2197bbb540fd7248ddebcc36621')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-archives-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-archives-${pkgver}.gem"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
