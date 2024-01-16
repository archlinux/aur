# former Maintainer: M. L. Thaler <xxxxx at gmail.com>
_gemname=annyong
pkgname=annyong
pkgver=0.4.1
pkgrel=0
pkgdesc="Starts a public webserver for files in the current directory"
arch=(any)
url="https://github.com/remiprev/annyong"
license=('Custom')
depends=('ruby' 'ruby-rack')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
sha256sums=('307b00a61f2d76d03a44f6958a8d4a9b35e11c39999d7fe057015af156329658')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # License is BSD-like but uses exotic wording
  tar -xvf data.tar.gz
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
