pkgname=git-ad-git
pkgver=r3.d721f62
pkgrel=1
pkgdesc="Displays one of three fictional advertisements for git add typos."
arch=(any)
url="https://github.com/supurazako/git-ad"
license=("MIT OR Apache-2.0")
depends=('git')
conflicts=('git-ad')
provides=("git-ad=${pkgver}")

source=("git+https://github.com/supurazako/git-ad#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd git-ad
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd git-ad
    env INSTALL_DIR="${pkgdir}/usr/bin" bash install.sh 
    install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
