# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.9.10
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
sha256sums=('4beb9074da75bfe44a502db61542c557af1a6206a3cdd6e36c3f0743d71417ec')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${_pkgname}.zsh"
	cp -r functions/ "${pkgdir}/usr/share/${pkgname}/"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	find man/man1/ -type f -name '*.1' -exec \
		install -Dm644 -t "${pkgdir}/usr/share/man/man1" {} \;
}

# nvim: set ts=2 sw=2 noet:
