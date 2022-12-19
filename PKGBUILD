# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=neon-podcaster-git
pkgver=1.r6.5e5f218
pkgrel=1
epoch=
pkgdesc="A command line podcast client"
arch=('x86_64')
url="https://www.gitlab.com/utilities-n-apps/neon-podcaster.git"
license=('GPL3')
groups=()
depends=(python-feedparser)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(neon-podcaster-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd neon-podcaster
    printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd neon-podcaster
    install -Dm755 src/neon-podcaster.py "${pkgdir}/usr/bin/neon-podcaster" 
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

