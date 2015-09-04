# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=sass
pkgname=ruby-$_pkgname
pkgver=3.4.17
pkgrel=1
pkgdesc="Tools and Ruby libraries for the CSS3 extension languages: Sass and SCSS."
arch=("any")
url="http://sass-lang.com/"
license=("MIT")
depends=("ruby-yard" "ruby-maruku")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("2d0fda87240e0133e04f2fd30d0184c0cb13f9b5235fbf3fc4efc038f1b3da58")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
