# former Maintainer: M. L. Thaler <xxxxx at gmail.com>
_gemname=annyong
pkgname=annyong
pkgver=0.3
pkgrel=2
pkgdesc="Starts a public webserver for files in the current directory"
arch=(any)
url="https://github.com/remiprev/annyong"
license=('Custom')
depends=('ruby' 'ruby-rack-1.4')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
sha256sums=('c29d39fa86a1920c6e8fff481785ce667d1b0dec18730d34994742ad3c934622')

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
