# Maintainer: Steven Cook <princeconcord at protonmail dot com>

pkgname=openinfraquote-bin
_pkgname=openinfraquote
pkgver=1.10.0
pkgrel=1
pkgdesc="Fast, open-source tool for estimating infrastructure costs from Terraform plans and state files"
arch=('x86_64')
url="https://github.com/terrateamio/openinfraquote"
license=('MPL-2.0')
install="openinfraquote.install"
optdepends=('gzip')
provides=('openinfraquote')
conflicts=('openinfraquote')
source=(
    "https://github.com/terrateamio/openinfraquote/releases/download/v${pkgver}/oiq-linux-amd64-v${pkgver}.tar.gz"
    "openinfraquote-prices.service"
    "openinfraquote-prices.timer"
    "update-prices.sh"
)
sha256sums=(
    "dbb09e8a76bf701e3e58cc106dac26496ab98b708bdbaec8a70424374a27270d"
    "dca19c613b44184f24f0c70d7499385bab54ad1570e005c515a38da88886c626"
    "65ecb78fab3bd8d26d06724e6ea3dc6e3628363ccf842d365720b0aed41904cf"
    "a9e222d6ca049fdaeb690eb68df363b2cf0632147dea486bc04b1012702f42be"
)

package() {
    install -Dm755 "${srcdir}/oiq" "${pkgdir}/opt/${_pkgname}/oiq"
    install -Dm644 "${srcdir}/openinfraquote-prices.service" "${pkgdir}/usr/lib/systemd/system/openinfraquote-prices.service"
    install -Dm644 "${srcdir}/openinfraquote-prices.timer" "${pkgdir}/usr/lib/systemd/system/openinfraquote-prices.timer"
    install -Dm755 "${srcdir}/update-prices.sh" "${pkgdir}/opt/${_pkgname}/update-prices.sh"
}
