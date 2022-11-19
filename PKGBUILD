# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

_gemname=matrix
pkgname=ruby-matrix
pkgver=0.4.2
pkgrel=1
pkgdesc='An implementation of Matrix and Vector classes'
arch=(any)
url='https://github.com/ruby/matrix'
license=('custom:BSD2')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('71083ccbd67a14a43bfa78d3e4dc0f4b503b9cc18e5b4b1d686dc0f9ef7c4cc0')

package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install --verbose \
        -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" \
        "$_gemname-$pkgver.gem"

    install -Dm644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
