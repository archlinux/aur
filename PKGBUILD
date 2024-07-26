# Maintainer: Lorenzo Bodini <lorenzo.bodini@prabo.org>
pkgname=priv-git
_pkgname=${pkgname%-git}
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Simple dm-crypt wrapper, witten in bash"
arch=(any)
url="https://github.com/topongo/priv"
license=('GPL-3.0-or-later')
groups=()
# scripts are written in zsh, not bash
depends=(cryptsetup zsh)
makedepends=(git)
backup=("etc/priv.conf")
source=("git+${url}")
sha256sums=("SKIP")

package() {
    cd "$_pkgname"
    PRIV_INSTALL_SKIP_CONF=true PREFIX="${pkgdir}/usr" ./install.sh
    install -Dm 755 priv.conf "${pkgdir}/etc/priv.conf"
}

