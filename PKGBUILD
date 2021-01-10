# Maintainer: <gaelic>
# Maintainer: Anatoly Bashmakov anatoly at posteo dot net

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.4
pkgrel=1
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=(MIT)
depends=(asciidoctor
         ruby-concurrent
         ruby-prawn
         'ruby-prawn-icon<3'
         ruby-prawn-svg
         ruby-prawn-table
         ruby-prawn-templates
         ruby-safe_yaml
         ruby-thread_safe
         ruby-treetop
         'ruby-ttfunk<1.6')
optdepends=('ruby-rouge: syntax highlight'
            'ruby-coderay: syntax highlight')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c7a8998e905770628829972320017415174e69dea29fd0717e08e49d69b2104d')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
