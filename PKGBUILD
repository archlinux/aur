# Maintainer: Carl George < arch at cgtx dot us >

_uuid="syncthingicon@jay.strict@posteo.de"
pkgname="gnome-shell-extension-syncthing-git"
pkgver=r63.71d6d93
pkgrel=1
pkgdesc="Display Syncthing Icon in Top Bar"
arch=("any")
_githubname="gnome-shell-extension-syncthing"
_githubowner="jaystrictor"
url="https://github.com/$_githubowner/$_githubname"
license=("GPL")
depends=("gnome-shell")
makedepends=("git" "gnome-common")
conflicts=("gnome-shell-extensions-syncthing")
source=("git+https://github.com/$_githubowner/$_githubname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_githubname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_githubname"
    install -D --mode 644 --target-directory $pkgdir/usr/share/gnome-shell/extensions/$_uuid *.js *.css metadata.json
    install -D --mode 644 --target-directory $pkgdir/usr/share/gnome-shell/extensions/$_uuid/icons icons/*.svg
    install -D --mode 644 --target-directory $pkgdir/usr/share/glib-2.0/schemas schemas/*.gschema.xml
}
