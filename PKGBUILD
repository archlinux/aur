# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Jay Tauron <jytrn@protonmail.com>
pkgname=s-bin
pkgver=0.5.16
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=()
options=('!strip' '!emptydirs')
provides=("s")
source=("${pkgname}_${pkgver}.zip::https://github.com/zquestz/s/releases/download/v${pkgver}/s-linux_amd64.zip")
sha256sums=('09c73d96b820c687963962cd5718cf0e509b08109265648426654efffac738ce')

package() {
	cd "${srcdir}/s-linux_amd64"

	install -Dm775 "s" "${pkgdir}/usr/bin/s"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/s/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/s/README.md"
	install -Dm644 "autocomplete/s-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/s"
	install -Dm644 "autocomplete/s.fish" "${pkgdir}/usr/share/fish/vendor-completions.d/s.fish"
}
