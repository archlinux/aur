# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.7.3
pkgrel=1
pkgdesc="the cure to slow zsh plugin management"
arch=(any)
url="https://getantidote.github.io/"
license=('MIT')
depends=('zsh' 'git')
install=zsh-antidote.install
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/mattmc3/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('760f102cefa965205270dee22db91d8d358b095e9a2073d636300035807cab72')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${_pkgname}.zsh"
	cp -r functions/ "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	find man/man1/ -type f -name '*.1' -exec \
		install -Dm644 -t "${pkgdir}/usr/share/man/man1" {} \;
}

# nvim: set ts=2 sw=2 noet:
