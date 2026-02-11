# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=jikkou-bin
_pkgname=jikkou
pkgver=0.36.6
pkgrel=1
pkgdesc="Open Source Resource as Code framework for Apache Kafka"
arch=("x86_64")
url="https://www.jikkou.io/"
license=("Apache-2.0")
provides=('jikkou')
conflicts=('jikkou')
source=("https://github.com/streamthoughts/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
depends=('zlib')

sha256sums=('69b749cd260d06e03cb062f4fca2b9019e0c5eab8e6281c8225f1c4f6c40038e')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 jikkou_completion "${pkgdir}/usr/share/bash-completion/completions/jikkou.bash"
}
