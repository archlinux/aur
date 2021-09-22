# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Tyler Swagar <distorto@member.fsf.org>

_fname=Signika
pkgname=ttf-${_fname,,}
pkgver=2.000
_pkgver="$_fname-${pkgver%00}"
pkgrel=1
pkgdesc='Sans-serif typeface from Google by Anna Giedryś'
arch=(any)
url="https://github.com/Ancymonic/$_fname"
license=(OFL)
conflicts=(ttf-google-fonts-opinionated-git
           ttf-signika-family-ib)
_archive="$_fname-$_pkgver"
source=("$_pkgver.tar.gz::$url/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('717d8e8525080e5f6df71aa2a423481adb2c634ff4756e2788717e96796b9051')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/signika{,negative,sc}/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt CONTRIBUTORS.txt AUTHORS.txt
}
