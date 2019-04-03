# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus
_pkgname="${pkgname#*-}"
pkgver=6.7
pkgrel=1
pkgdesc='The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion.'
depends=('fontconfig')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('custom: OFL')
url='https://github.com/libertinus-fonts/libertinus'
source=("https://github.com/libertinus-fonts/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('28412560134bdd191a689359cb4fc6e29c7803e8d50ad9bd89d9b292238bd38e')

package() {
	cd "${_pkgname^}-$pkgver"
	find . -name '*.otf' -execdir install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF/{} \;
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL"
}
