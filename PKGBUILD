# Maintainer: Cole Thompson <cole dot thompson at gmail dot com>

pkgname=ruby-ptools
pkgver=1.3.5
pkgrel=1
pkgdesc="Extensions to the File class based on Unix shell tools"
arch=('any')
url="https://rubygems.org/gems/ptools/"
license=('Artistic2.0')
depends=('ruby')
source=(https://rubygems.org/downloads/ptools-$pkgver.gem)
sha256sums=('f22018486355f90fb8f9bccc4b9b96d388a9178d0ef168eff4fca7a96d8061c9')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    ptools-$pkgver.gem
}

# vim:set ts=2 sw=2 et:
