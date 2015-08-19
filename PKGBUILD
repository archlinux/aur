# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=sass
pkgname=ruby-$_pkgname
pkgver=3.4.15
pkgrel=1
pkgdesc="Tools and Ruby libraries for the CSS3 extension languages: Sass and SCSS."
arch=("any")
url="http://sass-lang.com/"
license=("MIT")
depends=("ruby-yard" "ruby-maruku")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("6b461a469d29ec80b52b1401b5e5d58c48762a8f3e00f3b0b2d37b6791a87a59")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
