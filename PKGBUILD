# Maintainer: <gaelic>

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.0.alpha.16
pkgrel=2
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=()
depends=(asciidoctor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0f6b2a1533577dfba218de5dd886771447e4d1cb670b81d2c3bf3a180e6029a1')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    #install -Dm644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/LICENSE" \
    #    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    #install -Dm644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/man/asciidoctor.1" \
    #    "$pkgdir/usr/share/man/man1/asciidoctor.1"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
    rm -rf "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/man"
}
