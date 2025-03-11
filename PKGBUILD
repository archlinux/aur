# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm
_reponame=nvm.fish
pkgver=2.2.17
pkgrel=1
pkgdesc="Node.js version manager lovingly made for Fish"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
install=fish-nvm.install
provides=("${pkgname}=${pkgver}")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('303e1b7bab5645fa6de830bd59ccec5fe0d31eee6c1e201f0051285d4db14cc0e052dba111b338b97914b1ed04de6806ce3b61b2581cd38f98ef8f00ecd89a22')

package() {
	cd "${_reponame}-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
