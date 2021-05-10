# Maintainer: <gaelic>
# Maintainer: Anatoly Bashmakov anatoly at posteo dot net

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.6.0
pkgrel=1
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=(MIT)
depends=(asciidoctor
         ruby-concurrent
         ruby-prawn
         ruby-prawn-icon
         ruby-prawn-svg
         ruby-prawn-table
         ruby-prawn-templates
         ruby-safe_yaml
         ruby-treetop)
optdepends=('ruby-rouge: syntax highlight'
            'ruby-coderay: syntax highlight')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('89c730499bbc4086710ae0c1b9ac1510b8457d6861b9b31495e64871f1f8ae6b')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
