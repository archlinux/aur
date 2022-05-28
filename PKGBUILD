# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=seccomp-tools
pkgver=1.5.0
pkgrel=2
pkgdesc="Provide powerful tools for seccomp analysis."
arch=(any)
url="https://github.com/david942j/seccomp-tools"
license=('MIT')
groups=()
depends=(
  ruby
  ruby-os
)
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
sha1sums=('f8de199c3c2e3c0f2fee36e54da507de21653b93')
noextract=($pkgname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
