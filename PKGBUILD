# Maintainer: Eric Renfro <psi-jack@linux-help.org>
_pkgbase=clamaurscan
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically scan AUR packages with ClamAV before building them with Paru or Yay."
url="https://codeberg.org/psi-jack/${_pkgbase}"
license=("GPL-3.0-or-later")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("SKIP")
arch=('any')
depends=("bash" "clamav" "pacman" "findutils")
optdepends=("paru" "yay")
makedepends=("git")
conflicts=("clamaurscan-git")

package() {
    cd "${_pkgbase}"
    install -Dm755 --no-target-directory "clamaurscan" "${pkgdir}/usr/bin/clamaurscan"
    install -Dm755 --no-target-directory "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
