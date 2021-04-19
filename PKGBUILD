# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc-beta
pkgver=2.9.4
pkgrel=1
pkgdesc="An extensible calculator written in Python. Development/Beta Channel."
arch=('any')
url="https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator"
license=('GPL')
groups=('')
depends=('bash-completion' 'python-pip' 'dialog')
makedepends=("tar")
conflicts=("iicalc")
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("iicalc-$pkgver.deb::https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator/-/jobs/artifacts/development/raw/iicalc.deb?job=debian%20packager")
sha512sums=('d2637f36d26f515ed2c143c5db4f74e43bfb0a77c5a6843335120b24a6a4e4efa8488afe9b280a78ba3432524251a83e6ce3612e632308a0cbfba564ead86ab0')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	rm debian-binary control.tar.xz data.tar.xz
	sed -i -E 's/debian/aur/' ${pkgdir}/usr/share/iicalc/config.ini

}