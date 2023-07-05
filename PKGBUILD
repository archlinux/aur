# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >
# Contributor: Caleb Maclennan <caleb@alerque.com>
pkgname=git-town-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="Git workflow automation to keep branches in sync and reduce merge conflicts."
url="https://www.git-town.com/"
_githuburl="https://github.com/git-town/git-town"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('git')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm_64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_intel_64.deb")
source=("LICENSE::https://raw.githubusercontent.com/git-town/git-town/main/LICENSE")
sha256sums=('83067ad148e1c7c64566986f7717428b3632f1982d0ffb72c4a254be0a521730')
sha256sums_x86_64=('3aace3d13564d02993f765e2fcb99769993a784d74a2d69b45ee8a7c58f98c01')
sha256sums_aarch64=('f5b5480aaa8560de5c370c03e77b817cbf0d885c8079c9a0129ab4403d56e776')

package() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
	install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}