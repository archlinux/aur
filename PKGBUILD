# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sean Bartell <wingedtachikoma@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

_gemname=fxruby
pkgname=ruby-$_gemname
pkgver=1.6.30
pkgrel=1
pkgdesc="The Ruby binding to the FOX GUI toolkit."
arch=('i686' 'x86_64')
url="http://www.fxruby.org/"
license=('LGPL')
depends=("fox" "ruby")
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('cd551740d0d12327aeaefc4426159bea3451d21894bb8ef81d1aa78d33ebae8c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
