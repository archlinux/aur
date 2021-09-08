# Maintainer: ravi0li <mail+aur at moritz dot pw>
pkgname=hledger-flow-bin
_gitname=${pkgname%-bin}
pkgver=0.15.0
pkgrel=1
pkgdesc="An hledger/ledger-cli workflow focusing on automated statement import and classification"
arch=('x86_64')
url="https://github.com/apauley/hledger-flow"
license=('GPL')
_github_release_commit_hash="2b025fe"
_github_release_file_name="hledger-flow_Linux_x86_64_v${pkgver}_${_github_release_commit_hash}"
source=("https://github.com/apauley/${_gitname}/releases/download/v${pkgver}/${_github_release_file_name}.tar.gz"
	"https://raw.githubusercontent.com/apauley/${_gitname}/master/LICENSE")
sha256sums=("c2bc693a3871eb23464bc5706d4b1effcf0dfe8b8b5754b8182be065df0934e2" "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986")

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_github_release_file_name}/hledger-flow"
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
