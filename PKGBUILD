# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=jikkou-bin
_pkgname=jikkou
pkgver=1.1.0
pkgrel=1
pkgdesc="Open Source Resource as Code framework for Apache Kafka"
arch=("x86_64")
url="https://www.jikkou.io/"
license=("Apache-2.0")
provides=('jikkou')
conflicts=('jikkou')
source=("https://github.com/streamthoughts/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
depends=('zlib')

b2sums=('2770b228e0aead4b706e53230492a2a109473724860ed13cdfbc0f5182ec70c42640ffb3aedcc8ef0baf32963bfccf86644288e0d311ade471e275c77fe08d27')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 jikkou_completion "${pkgdir}/usr/share/bash-completion/completions/jikkou.bash"
}
