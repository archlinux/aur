# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=fish-nvm
_reponame=nvm.fish
pkgver=2.2.10
pkgrel=1
pkgdesc="Node.js version manager lovingly made for Fish"
arch=('x86_64')
url="https://github.com/jorgebucaran/${_reponame}"
license=('MIT')
depends=('fish')
install=fish-nvm.install
provides=("${pkgname}=${pkgver}")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('f08c4b50a77692abfc84f37a7ae887e14831a16131cb55f703db22ffd042bfe8bdb9867d7d078f5acd156609f45aa7f0bd67c695a4f1495584a9134555091990')

package() {
	cd "${_reponame}-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" README.md
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" completions/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_conf.d/" conf.d/*
	install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d/" functions/*
}
