# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>
pkgname=seccomp-tools
pkgver=1.6.0
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
sha256sums=('d8ac85a3e3e0ab51c87375d611755a26c4be80699390c32be4afa06d295b7449')
noextract=("$pkgname-$pkgver".gem)

package() {
	local _gemdir="$(ruby -e 'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver".gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
