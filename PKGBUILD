# Maintainer: Joachim Klahr <klarre@unix-like.se>

pkgname='ntix'
_tag='9fa67d4d808b476fec915b50f14d9166330b0fba'
pkgver=0.1.0
pkgrel=1
pkgdesc="This hierarchical note-taking application syncs with Git for version control. The user-friendly command-line interface makes organizing notes easy."
arch=('any')
url="https://git.sr.ht/~klahr/ntix"
license=('GPL2')
optdepends=('tree'
            'bash-completion')
source=("https://git.sr.ht/~klahr/ntix/archive/${_tag}.tar.gz")
sha256sums=('8e26f2c3273b88048743a20ea7a3261a96ddc1de577dccd6a69a8bf3c581eda2')

package() {
	cd "${pkgname}-${_tag}"
	rm -rf "${pkgdir}/opt/${pkgname}/ntix"
	mkdir -p "${pkgdir}/opt/${pkgname}/ntix"
	install -Dm644 man/ntix.1 "${pkgdir}/usr/local/man/man1/ntix.1"
	install -Dm755 completions/ntix.bash "${pkgdir}/usr/share/bash-completion/completions/ntix"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 src/ntix.sh "${pkgdir}"/usr/bin/ntix
}
