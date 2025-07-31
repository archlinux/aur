# Maintainer: Ms. Haze <ms-haze@riseup.net>
pkgname=aurscan-git
pkgver=r1.fe967983
pkgrel=2
pkgdesc="Automatically scan AUR packages with ClamAV before building them with Paru."
url="https://gitlab.com/MayESchaefer/aurscan"
license=("GPL-3.0-or-later")
source=("git+$url")
md5sums=("SKIP")
arch=('any')
depends=("paru" "bash" "clamav" "pacman" "findutils")
makedepends=("git")

package() {
    cd "$srcdir/aurscan"
    install -Dm755 --no-target-directory "scan.sh" "${pkgdir}/usr/bin/aurscan"
    echo "Remember to add \"PreBuildCommand = aurscan\" to the \"[bin]\" section of your paru.conf (usually \"~/.config/paru/paru.conf\")"
}
