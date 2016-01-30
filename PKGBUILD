# Maintainer: Johannes Maibaum <jmaibaum@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=otf-libertinus
_pkgname=${pkgname#*-}
pkgver=6.2
pkgrel=2
pkgdesc="The Libertinus font family. A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
depends=('fontconfig' 'xorg-mkfontdir')
conflicts=('otf-libertine-git' 'otf-libertinus-git')
arch=('any')
license=('OFL')
url="https://github.com/khaledhosny/libertinus"
install=$pkgname.install
source=("https://github.com/khaledhosny/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f3c20cd0c07bc36467693611d9d520bacf36df35e8af7b8338aaf52064b6c6e3')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
}
