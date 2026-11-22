# Maintainer: Eric Renfro <psi-jack@linux-help.org>
pkgname=clamaurscan-git
pkgver=r1.0f5b135
pkgrel=5
pkgdesc="Automatically scan AUR packages with ClamAV before building them with Paru."
url="https://codeberg.org/psi-jack/clamaurscan.git"
license=("GPL-3.0-or-later")
source=("git+$url")
md5sums=("SKIP")
arch=('any')
depends=("bash" "clamav" "pacman" "findutils")
optdepends=("paru" "yay")
makedepends=("git")
conflicts=("aurscan-git")

package() {
    cd "$srcdir/clamaurscan"
    install -Dm755 --no-target-directory "clamaurscan" "${pkgdir}/usr/bin/clamaurscan"
    echo "Remember to add \"PreBuildCommand = clamaurscan\" to the \"[bin]\" section of your paru.conf (usually \"/etc/paru.conf\" or \"~/.config/paru/paru.conf\")"
    echo "Check out the README.md for more information on how to use this package:"
    echo "https://codeberg.org/psi-jack/clamaurscan/src/branch/main/README.md"
}
