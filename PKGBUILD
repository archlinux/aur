# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm
_reponame=nvm.fish
pkgver=2.0.1
pkgrel=1
pkgdesc="Node.js version manager lovingly made for Fish"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
provides=("${pkgname}=${pkgver}")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('40b6391b8e4d0d908be91115b3d6c2bf4efb22f49c43cff2f5abf21d6be2c7afd70dca16ab5edef7ddc3539f88a563ca4b76f822b42a4aed8fc6263c215dea2d')

package() {
	cd "${_reponame}-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
