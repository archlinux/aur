# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.9
pkgrel=1
pkgdesc='The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion.'
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url='https://github.com/libertinus-fonts/libertinus'
source=("https://github.com/libertinus-fonts/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('d21ac19087cba270d98f344953cbcaeeea3b7271c5aac081c10162268ea4f77b')

package() {
	cd "${_pkgname^}-$pkgver"
	find . -name '*.otf' -execdir install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL"
}
