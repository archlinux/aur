# Maintainer: <gaelic>

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.0.rc.2
pkgrel=1
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=()
depends=(asciidoctor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('97717d81d884aaf45f48c79045b6a9581af655452132830f3495c46d179b6fbc')
package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$pkgname-$pkgver.gem"

    rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
    rm -rf "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/man"
}
