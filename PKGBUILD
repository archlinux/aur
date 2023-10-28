# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.9.3
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
sha256sums=('15c3ea54ad85e859d682f0a07f767e5ec94e2ffd0b3472cd491df52ebbddb74f')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${_pkgname}.zsh"
	cp -r functions/ "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	find man/man1/ -type f -name '*.1' -exec \
		install -Dm644 -t "${pkgdir}/usr/share/man/man1" {} \;
}

# nvim: set ts=2 sw=2 noet:
