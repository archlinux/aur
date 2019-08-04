pkgname=shellcheck-static
pkgver=0.7.0
pkgrel=2
url="https://shellcheck.net"
pkgdesc="shellcheck, without the 130MB haskell dependencies"
license=("AGPL3")
arch=("x86_64")
depends=('gmp')
conflicts=("shellcheck")
provides=("shellcheck=$pkgver")

# The statically-linked binary provided by the developer. See:
# https://github.com/koalaman/shellcheck#installing
source=("https://storage.googleapis.com/shellcheck/shellcheck-v${pkgver}.linux.${CARCH}.tar.xz")
# From https://storage.googleapis.com/shellcheck/shellcheck-v${pkgver}.linux.${CARCH}.tar.xz.sha512sum
sha512sums=('84e06bee3c8b8c25f46906350fb32708f4b661636c04e55bd19cdd1071265112d84906055372149678d37f09a1667019488c62a0561b81fe6a6b45ad4fae4ac0')

package() {
    cd "${srcdir}/shellcheck-v$pkgver"
    install -Dt "${pkgdir}/usr/bin" "shellcheck"
    install -Dt "${pkgdir}/usr/share/shellcheck" "LICENSE.txt" "README.txt"
}
