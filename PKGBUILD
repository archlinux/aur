# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=steamguard-cli-bin
pkgver=0.17.1
pkgrel=2
pkgdesc="A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations."
arch=('x86_64')
url='https://github.com/dyc3/steamguard-cli'
license=('GPL3')
makedepends=('curl' 'jq')
provides=('steamguard')
source=(
	"https://github.com/dyc3/steamguard-cli/releases/download/v${pkgver}/steamguard"
)
sha256sums=(
	'dfde53c5f594815b69349e6b70cbb26fbf9ddb30938aa13352048967279ac501'
)

pkgver() {
	curl -s "https://api.github.com/repos/dyc3/steamguard-cli/releases/latest" | 
	jq -r '.tag_name' | sed 's/^v//'
}

package() {
	install -Dm755 "${srcdir}"/steamguard "${pkgdir}/usr/bin/steamguard"
}
