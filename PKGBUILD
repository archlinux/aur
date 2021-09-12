# Maintainer: Emil Rasmus Merzin <rasmusmerzin@gmail.com>
pkgname=osoy-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Git repository manager'
arch=('x86_64')
url='https://gitlab.com/osoy/osoy'
license=('MIT')
provides=('osoy')
conflicts=('osoy')
source=("https://downloads.sourceforge.net/project/osoy/osoy-v${pkgver}.tar.gz")
sha1sums=('821b35c0792fae34a342760262bc86adf4837d30')
md5sums=('b58541b03a67e22f85d31cd55088cbe7')

package() {
	"${srcdir}/osoy" completions bash > "${srcdir}/bash"
	"${srcdir}/osoy" completions zsh > "${srcdir}/zsh"
	"${srcdir}/osoy" completions fish > "${srcdir}/fish"
	install -Dm755 "${srcdir}/osoy" "${pkgdir}/usr/bin/osoy"
	install -Dm644 "${srcdir}/bash" "${pkgdir}/usr/share/bash-completion/completions/osoy"
	install -Dm644 "${srcdir}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_osoy"
	install -Dm644 "${srcdir}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/osoy.fish"
}
