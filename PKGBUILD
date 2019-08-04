pkgname=shellcheck-static
pkgver=0.7.0
pkgrel=1
pkgdesc="shellcheck, without the 130MB haskell dependencies"
license=("AGPL3")
arch=("x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=0.6.0")

# The statically-linked binary provided by the developer. See:
# https://github.com/koalaman/shellcheck#installing
source=("https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz")
sha256sums=('092f8ece0bb8413c835f4ecc14c9f1157ebb44a36a216e3d617d1048ecdfce1b')

package() {
    cd "${srcdir}/shellcheck-stable"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
