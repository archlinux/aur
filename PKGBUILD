# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Brice Waegeneire <brice dot wge at gmail dot com>

_gemname=progressbar
pkgname=ruby-$_gemname
pkgver=0.21.0
pkgrel=1
pkgdesc="A text progress bar library for Ruby"
arch=(any)
url="https://github.com/peleteiro/progressbar"
license=('RUBY')
depends=('ruby')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha512sums=('63ef32fd583af0dc75284cbc94dae12883d0ba662a7cbfb0bcfdb09d936f2ef2628fee784f680e37316607b63f51ff538667b723cd904d63d01fe79d02f8ebbc')
noextract=($_gemname-$pkgver.gem)

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    "$_gemname-$pkgver.gem"

  install -Dm644 $(find "${pkgdir}" -name LICENSE) \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
