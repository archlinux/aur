# Maintainer: Andrii Burkivskyi <buryk212@gmail.com>
_gitname='zsh-systemd'
pkgname="${_gitname}-git"
pkgver=r1.0d6af3e
pkgrel=1
pkgdesc="The systemd plugin for Zshell provides many useful aliases for systemd."
arch=('any')
url="https://github.com/le0me55i/zsh-systemd"
depends=('zsh')
makedepends=('git')
provides=('zsh-systemd')
conflicts=('zsh-systemd')
source=('git+https://github.com/le0me55i/zsh-systemd.git')
install=zsh-systemd-git.install
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"

	install -Dm644 systemd.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/${_gitname}/systemd.plugin.zsh"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"
}

