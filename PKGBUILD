# Maintainer: Emil Rasmus Merzin <rasmusmerzin@gmail.com>
pkgname=osoy-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Git repository manager'
arch=('x86_64')
url='https://gitlab.com/osoy/osoy'
license=('MIT')
provides=('osoy')
conflicts=('osoy')
optdepends=('make')
source=("https://downloads.sourceforge.net/project/osoy/osoy-v0.5.1.tar.gz")
sha1sums=('1531c97bb87a9308d2a6e27ae7afa0808bb08b11')
md5sums=('c46b836161064287bf00b6d6ba54afd3')

package() {
	"${srcdir}/osoy" completions bash > "${srcdir}/bash"
	"${srcdir}/osoy" completions zsh > "${srcdir}/zsh"
	"${srcdir}/osoy" completions fish > "${srcdir}/fish"
	install -Dm755 "${srcdir}/osoy" "${pkgdir}/usr/bin/osoy"
	install -Dm644 "${srcdir}/bash" "${pkgdir}/usr/share/bash-completion/completions/osoy"
	install -Dm644 "${srcdir}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_osoy"
	install -Dm644 "${srcdir}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/osoy.fish"
}
