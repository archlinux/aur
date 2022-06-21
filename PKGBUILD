# Maintainer: Nikola Hadžić <nikola.hadzic.000@protonmail.com>
pkgname="shnote"
pkgver="1.0"
pkgrel=1
pkgdesc="A simple TUI note-taking application written in Bash"
arch=("any")
url="https://gitlab.com/NH000/shnote"
license=("GPL3")
depends=("bash" "coreutils" "gettext")
makedepends=("sed")
source=("$pkgname-$pkgver::git+$url#tag=6913c40c9122c0ce2e7ee45cdd33696afea1c519")
sha256sums=("SKIP")

package() {
	cd "$pkgname-$pkgver"

    install -D "shnote.sh" "$pkgdir/usr/bin/shnote"
    sed -i '20s/$/"\/usr\/share\/locale"/' "$pkgdir/usr/bin/shnote"
    sed -i '21s/$/"shnote"/' "$pkgdir/usr/bin/shnote"

    mkdir -p "$pkgdir/usr/share/locale/sr/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr/LC_MESSAGES/shnote.mo" "po/sr.po"
    mkdir -p "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/sr_RS@latin/LC_MESSAGES/shnote.mo" "po/sr_RS@latin.po"
}
