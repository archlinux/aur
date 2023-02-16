# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.0
pkgrel=1
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/arl/gitmux"
license=('MIT')
depends=('tmux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3aa245c86561202e2fa8110a93c2864bf712c6467ebf0024e8a10ea0c69786f')
sha256sums_i686=('17435b54aac9917d0f65bd93208508e0fa3964531e235c58bb7f61f5533d7c20')
sha256sums_aarch64=('97f0909aea96a33b473066474a2dd0a770cfe93b94f7af9d2f1d179a68bcafa5')

package() {
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
