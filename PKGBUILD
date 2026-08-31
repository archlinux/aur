# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: nous <nous@artixlinux.org>

pkgname=iso-profiles-git
pkgver=2026.08
pkgrel=1
pkgdesc='Artix iso profiles'
arch=('any')
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-profiles'
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
    date +%Y.%m
}

package() {
    cd "${pkgname%-git}"
    install -d "${pkgdir}"/usr/share/artools/iso-profiles
    cp -a {base,common,plasma,cinnamon,lxde,lxqt,mate,moksha,xfce} "${pkgdir}"/usr/share/artools/iso-profiles
}
