# Maintainer: <gaelic>

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.0.alpha.18
pkgrel=1
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=()
depends=(asciidoctor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('12d8848a3e0d154babb594910d611256f33e0dc6dc3e910bda7ec2a506892fa7')
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
