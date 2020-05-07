# Maintainer: Daniel Nagy <danielnagy@posteo.de>
pkgname=bugit-git
pkgver=r82.381a3e8
pkgrel=1
pkgdesc="BuGit: File-less distributed bug tracking system with Git"
arch=('any')
url="https://gitlab.com/monnier/bugit"
license=('GPL3')
groups=()
depends=("git" "markdown")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://gitlab.com/monnier/bugit')
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	  cd "$srcdir/${pkgname%-git}"
    install -D -m755 bugit "$pkgdir"/usr/bin/bugit
}
