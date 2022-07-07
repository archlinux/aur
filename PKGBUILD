# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm
_reponame=nvm.fish
pkgver=2.2.8
pkgrel=1
pkgdesc="Node.js version manager lovingly made for Fish"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
install=fish-nvm.install
provides=("${pkgname}=${pkgver}")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('4fa9bacdd3b0f1bad5f174c883d8138530e232542da379f4f6647895ad7242cdcef674194bd2dcf958b22a5c98de174c23142a8a4d0e4b390a1acff23303e632')

package() {
	cd "${_reponame}-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
