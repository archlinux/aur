# Maintainer: <gaelic>
# Maintainer: Anatoly Bashmakov anatoly at posteo dot net

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.3
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
         ruby-thread_safe
         ruby-treetop
         'ruby-ttfunk<1.6')
optdepends=('ruby-rouge: syntax highlight'
            'ruby-coderay: syntax highlight')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('3e70d0e513f4d631a4b667fed634700d93b104e0d3b4c33f993979df6a67d3f1')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
