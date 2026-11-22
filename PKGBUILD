# Maintainer: Eric Renfro <psi-jack@linux-help.org>
_pkgbase=clamaurscan
pkgname=${_pkgbase}
pkgver=1.0.0
pkgrel=2
pkgdesc="Automatically scan AUR packages with ClamAV before building them with Paru or Yay."
url="https://codeberg.org/psi-jack/${_pkgbase}"
license=("GPL-3.0-or-later")
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('4917e3dbf20248e74259760ddd282669')
sha512sums=('ef218260da10e7ccfaa8772c9e9ee9ff8e6a0a4458671d6c6ff09b7f6e22a4edb9dbf759260c273151c67ef0b4b58b67ec3101d639f479bb703040715c59ec32')
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
