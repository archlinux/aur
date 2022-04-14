# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm
_reponame=nvm.fish
pkgver=2.2.7
pkgrel=1
pkgdesc="Node.js version manager lovingly made for Fish"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
install=fish-nvm.install
provides=("${pkgname}=${pkgver}")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('0ec84470298a6a876605db0636645d9fa0b0f17da324b1500f543c315ecec3fc48d43e099b4d51c0e2431a8586c56ad2f26162e9f996aee1d427e9dc8e140267')

package() {
	cd "${_reponame}-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
