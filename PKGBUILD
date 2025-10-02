# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=jikkou-bin
_pkgname=jikkou
pkgver=0.36.2
pkgrel=1
pkgdesc="Open Source Resource as Code framework for Apache Kafka"
arch=("x86_64")
url="https://www.jikkou.io/"
license=("Apache-2.0")
provides=('jikkou')
conflicts=('jikkou')
source=("https://github.com/streamthoughts/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
depends=('zlib')

sha256sums=('f9817e0fb44dd23c0c5fab97bbe6115fb8204f4b33f6c14786c179d926c9375e')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 jikkou_completion "${pkgdir}/usr/share/bash-completion/completions/jikkou.bash"
}
