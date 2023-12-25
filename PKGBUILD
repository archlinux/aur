# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=seccomp-tools
pkgver=1.6.1
pkgrel=1
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
sha256sums=('43e9dbbe6ad7e148263199f8e3b6cdf409fbcce5a8f6d6f20530d257fcf2bf6c')
noextract=("$pkgname-$pkgver".gem)

package() {
	local _gemdir="$(ruby -e 'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver".gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
