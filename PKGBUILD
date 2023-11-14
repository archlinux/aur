# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>
pkgname=shellshoccar-jpn-tukubai
pkgver=1.450.1
pkgrel=2
pkgdesc="ShellShoccar-Jpn's fork of Open usp Tukubai implemented in shellscript"
arch=(any)
url="https://github.com/Tpaefawzen/ShellShoccar-jpn-Tukubai-just-sh"
license=(custom:ISC)
groups=(shellshoccar-jpn)
provides=("${pkgname%-git}" open-usp-tukubai)
conflicts=("${pkgname%-git}" open-usp-tukubai)
replaces=('shellshoccar-jpn-tukubai-git')
options=()
install=
source=($pkgname.tar.gz::'https://github.com/Tpaefawzen/ShellShoccar-jpn-Tukubai-just-sh/archive/refs/tags/'"v${pkgver}"'.tar.gz')
md5sums=('e05856e2739ca5c6d706a1af7f58e3fb')

_upstream_srcname='ShellShoccar-jpn-Tukubai-just-sh-'"${pkgver}"

prepare() {
	cd "$srcdir/$_upstream_srcname"

	warning "Renaming Tukubai's tcat to tukubai-tcat to avoid confliction with gsm's /usr/bin/tcat"
	mv COMMANDS.SH/tcat COMMANDS.SH/tukubai-tcat

	./configure
}

package() {
	cd "$srcdir/$_upstream_srcname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}

