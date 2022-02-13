# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Ellison <thomasjlsn@gmail.com>
pkgname=pw-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A simple password manager"
arch=(any)
url="https://gitlab.com/thomasjlsn/pw"
license=('GPL3')
groups=()
depends=(gnupg tree)
makedepends=()
checkdepends=()
optdepends=()
provides=(pw)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd pw
    printf "%s.r%s.%s" "1.0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd pw
    install -Dm755 pw.sh "$pkgdir/usr/bin/pw"
    install -Dm644 pw.1  "$pkgdir/usr/share/man/man1/pw.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pw/LICENSE"
    install -Dm644 completion/bash_completion "$pkgdir/usr/share/bash-completion/completions/_pw"
    install -Dm644 completion/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_pw"
}
