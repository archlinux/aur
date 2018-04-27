# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=wayback_machine_downloader
pkgver=2.2.1
pkgrel=1
pkgdesc='Downloader for pages in the Internet Archive'
arch=(any)
url='https://github.com/hartator/wayback-machine-downloader'
license=(MIT) # License file is missing since it's not properly packaged in the gem.
depends=(ruby)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('623e5ef663930bb15f0dc46db21e33765a5f99b1f986a5308c4ad7ba2b0e6b8a')
options=(!emptydirs)

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
