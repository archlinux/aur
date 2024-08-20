# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=jikkou-bin
_pkgname=jikkou
pkgver=0.35.2
pkgrel=1
pkgdesc="Open Source Resource as Code framework for Apache Kafka"
arch=("x86_64")
url="https://www.jikkou.io/"
license=("Apache-2.0")
provides=('jikkou')
conflicts=('jikkou')
source=("https://github.com/streamthoughts/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${CARCH}.tar.gz")
depends=('zlib')

#options=("!strip")
sha256sums=("82f26c3e115c2eb4df9e64a701ca963339960e84309a77943c21721925366a80")

package() {
    cd "$srcdir/${_pkgname}-${pkgver}-linux-${CARCH}/"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 jikkou_completion "${pkgdir}/usr/share/bash-completion/completions/jikkou.bash"
}
