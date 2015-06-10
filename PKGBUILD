# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Adapted from the wizorb package contributed by TastyPi

_pkgname=wizorb
pkgname=$_pkgname-hib
pkgver=1.1
pkgrel=4
pkgdesc='A retro-RPG themed breakout style game (Humble Bundle version)'
url='http://www.wizorb.com'
license=('custom:commercial')
depends=('mono' 'openal')
arch=('i686' 'x86_64')
options=('!strip' '!upx')
source=("$_pkgname.sh" "$_pkgname.desktop")
sha512sums=('7ab7d83b7c99eafaee614832efa30b4f399eb0c62c47791ec9b3169eafe1195d4fdc9283c54190cf8aee916ec046b2557297d3c5000e732566ddf0f2efd8c8bb'
            '654dec6278d19d25440e74e7c850f3ab6f06c9af5ad39a7bf7dd8179234e1a3e763364e84aae7daab118db6b1a11d590bbe2621ff05fc7be40069f94bb97f331')
source_i686+=("hib://$_pkgname-32bit.tar.gz")
source_x86_64+=("hib://$_pkgname-64bit.tar.gz")
sha512sums_i686+=('b5997e9575c7339667c756d62893d0f20e264ca2cfda6383a3fa4a9ba2a40bfaaf943db5ebff4e73ae7f21624a83e3cfe7f7557b349e7b502282d00cf6959b91')
sha512sums_x86_64+=('c2ac71e97361e5b2eeaf547987a6de56df4663caf5b6d510b2db5a881ba5873ecb9ad4ba40c3dd8b91eebde5af5da60cdf16141c62fe009f0f43a88f15af7a05')

package() {
  install -d "$pkgdir/opt"
  cp -r $_pkgname "$pkgdir/opt/"
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

