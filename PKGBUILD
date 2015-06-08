# Contributor: strata <strata@dropswitch.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lrexlib
pkgver=2.7.2
pkgrel=1
pkgdesc="regular expression libraries for lua"
arch=('i686' 'x86_64')
url="http://rrthomas.github.com/lrexlib/"
source=('LICENSE')
md5sums=('57bcf624164eaa14fd37807983ea219b')
license=('custom:lua')
depends=('lua' 'oniguruma' 'tre' 'pcre')
makedepends=('git2cl-git' 'luarocks')
conflicts=('lrexlib-pcre5.1' 'lrexlib-pcre')

package() {
  luarocks --tree=${pkgdir}/usr install $pkgname-gnu
  luarocks --tree=${pkgdir}/usr install $pkgname-oniguruma
  luarocks --tree=${pkgdir}/usr install $pkgname-pcre
  luarocks --tree=${pkgdir}/usr install $pkgname-posix
  luarocks --tree=${pkgdir}/usr install $pkgname-tre
  install -Dm644 LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

