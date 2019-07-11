# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.10
pkgrel=1
pkgdesc='The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion.'
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url='https://github.com/libertinus-fonts/libertinus'
source=("https://github.com/libertinus-fonts/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('54cd1eedb95c67a4679a00ad2e2144c82395fc39cbcbf0ca88ea6dd1da4d5498')

package() {
	cd "${_pkgname^}-$pkgver"
	find . -name '*.otf' -execdir install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL"
}
