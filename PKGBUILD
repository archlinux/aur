# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

pkgname=gitlab-glab-bin
pkgver=1.21.1
pkgrel=1
epoch=
pkgdesc="An open source GitLab CLI tool written in Go"
arch=(x86_64)
url="https://github.com/profclems/glab"
license=('MIT')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(gitlab-glab)
conflicts=(gitlab-glab)
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/v${pkgver}/glab_${pkgver}_Linux_x86_64.tar.gz")
noextract=()
sha256sums=('c2e47065e1ec1d13a8cf78f31415332a56cd6bf934f4a393d6f5409f359aeb19')
validpgpkeys=()

package() {
	install -D bin/glab "${pkgdir}/usr/bin/glab"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Shell completions
	bin/glab completion -s bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/glab"
	bin/glab completion -s zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_glab"
	bin/glab completion -s fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/glab.fish"
}
