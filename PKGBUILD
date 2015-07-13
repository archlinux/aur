# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>

_gemname=rmagick
pkgname=ruby-rmagick
pkgver=2.15.2
pkgrel=1
pkgdesc="RMagick is an interface between the Ruby programming language and the ImageMagick image processing library"
arch=('i686' 'x86_64')
url='https://github.com/rmagick/rmagick'
license=('GPL')
depends=('ruby>=1.8.5' 'imagemagick>=6.4.9')
#source=("https://github.com/rmagick/rmagick/archive/RMagick_${pkgver//./-}.tar.gz")
source=("https://rubygems.org/downloads/rmagick-$pkgver.gem")
sha256sums=('33aae1aa0035e4fe20ae8700a5035d306188eeac3eb2297d3459dcda1bb44964')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
