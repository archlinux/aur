# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt-git
_reponame=mdt
pkgver=r36.36bbc05
pkgrel=2
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$_reponame"
license=('GPL3')
makedepends=('git')
depends=('gum')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    make -C $_reponame DESTDIR="$pkgdir" PREFIX="/usr" install
}
