# Maintainer: dringsim <dringsim@qq.com>

_pkgname=shimenkan
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=1.000
pkgrel=1
pkgdesc='Unicode font that supports the broad variety of writing systems that use the Miao (Pollard) script'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
_archive="$_fname-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('8bc2a4c152d0cefaa983deaccb9aeb7cd9b06901579d27ec0ca37b5d3cb7fe1f')

package() {
	cd "$_archive"
	find -type f -name "$_fname*.ttf" -execdir \
		install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" {} \;
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

