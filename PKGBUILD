# Maintainer: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='rmega'
pkgver=0.2.4
pkgrel=1
pkgdesc="mega.co.nz ruby api"
arch=('any')
url="https://github.com/topac/rmega"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=("http://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=("$pkgname-$pkgver.gem")
md5sums=('3b6c6a4c0af98808d89a9f16cdfea86f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
}
