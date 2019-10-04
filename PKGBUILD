# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>

_gemname=rails-html-sanitizer
pkgname=ruby-$_gemname
pkgver=1.2.0
pkgrel=1
pkgdesc='HTML sanitization for Rails applications'
arch=(any)
url='https://github.com/rails/rails-html-sanitizer'
license=(MIT)
depends=(ruby ruby-loofah)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('386f7b52a3c7a436ae2faa9886da3e5dc1b06c7ac90a9c58a1781d35eaef9c46')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
        -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

