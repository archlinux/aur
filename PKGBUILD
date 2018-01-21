pkgname=shellcheck-static
pkgver=0.4.7
pkgrel=2
pkgdesc="shellcheck, without the 130MB haskell dependencies"
license=("AGPL3")
arch=("i686" "x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=0.4.7")

# The statically-linked binary provided by the developer. See:
# https://github.com/koalaman/shellcheck#installing
source=("https://storage.googleapis.com/shellcheck/shellcheck-v${pkgver}.linux.x86_64.tar.xz")
sha256sums=('deeea92a4d3a9c5b16ba15210d9c1ab84a2e12e29bf856427700afd896bbdc93')

package() {
    cd "${srcdir}/shellcheck-v${pkgver}"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
