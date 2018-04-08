# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>

pkgname=ruby-html-proofer
pkgver=3.7.0
pkgrel=1
pkgdesc='Test your rendered HTML files to make sure they are accurate'
arch=(any)
url='https://github.com/gjtorikian/html-proofer'
license=('MIT')
depends=('ruby' 'ruby-mercenary' 'ruby-nokogiri' 'ruby-colorize' 'ruby-typhoeus' 'ruby-yell' 'ruby-parallel' 'ruby-addressable' 'ruby-activesupport')
options=(!emptydirs)
source=("https://rubygems.org/downloads/html-proofer-${pkgver}.gem"
        "LICENSE")
noextract=("html-proofer-${pkgver}.gem")
sha1sums=('fd804e5b09f77353cf5661e13453e719849ed860'
          'f90727a909db39508bcfdcfff6e9c225a295dc8a')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "html-proofer-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/html-proofer-${pkgver}.gem"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
