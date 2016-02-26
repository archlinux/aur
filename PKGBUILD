# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=sass
pkgname=ruby-$_pkgname
pkgver=3.4.21
pkgrel=1
pkgdesc="Tools and Ruby libraries for the CSS3 extension languages: Sass and SCSS."
arch=("any")
url="http://sass-lang.com/"
license=("MIT")
depends=("ruby-yard" "ruby-maruku")
makedepends=("rubygems")
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=("05f907ae3bde56e0133298295ff0befcfec2cb29799ef4f40236eb7abb5173d2")


package() {
	local _gemdir="$(ruby -rubygems -e"puts Gem.default_dir")"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
	install -D "$pkgdir$_gemdir/gems/$_pkgname-$pkgver/MIT-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
