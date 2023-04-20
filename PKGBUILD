# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt-git
_reponame=mdt
pkgver=1.2.1.r0.g07b04dd
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/mdt"
license=('GPL3')
makedepends=('git')
depends=('gum' 'findutils' 'gawk' 'grep' 'sed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_reponame"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    make -C $_reponame DESTDIR="$pkgdir" PREFIX="/usr" install
}
