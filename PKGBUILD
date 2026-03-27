# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=celq-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Query and transform JSON, YAML, TOML, XML, and JSON5 data with CEL expressions"
arch=('x86_64' 'aarch64')
url="https://github.com/IvanIsCoding/celq"
license=('MIT' 'Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("${pkgname}-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/IvanIsCoding/celq/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/IvanIsCoding/celq/releases/download/v${pkgver}/celq-linux-x86_64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/IvanIsCoding/celq/releases/download/v${pkgver}/celq-linux-aarch64-gnu.tar.gz")
sha256sums=('c73e3f239b267fb3f998a0535e250920e1e520ec3b5b567894798f76f56b9bb9')
sha256sums_x86_64=('d45753f8917dd99e8de51ae6c105ddb5fce115edfc191d50ba27d8aff069efe4')
sha256sums_aarch64=('ced6703e4caf21ab74b5fd8177ea833754a887cc42b02cf3adacd6461cfa67c1')

latestver() {
    curl -fsSL 'https://api.github.com/repos/IvanIsCoding/celq/releases/latest' |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 celq "${pkgdir}/usr/bin/celq"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
