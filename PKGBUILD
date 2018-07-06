pkgname=shellcheck-static
pkgver=0.5.0
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
sha256sums=('7d4c073a0342cf39bdb99c32b4749f1c022cf2cffdfb080c12c106aa9d341708')

package() {
    cd "${srcdir}/shellcheck-v${pkgver}"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
