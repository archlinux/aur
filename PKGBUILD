# Maintainer: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=usql-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=('x86_64')
url='https://github.com/xo/usql'
license=('MIT')
options=('!strip')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/v${pkgver}/usql_static-${pkgver}-linux-amd64.tar.bz2"
    'LICENSE::https://github.com/xo/usql/raw/master/LICENSE')
sha256sums=('3aa36c33a2bc96be47398a2f49a07b31aa784724ea62b0977f428f9b4107d787'
            'ab7cf54dcb0b4de0442aa073f93501b667dcfba13e7576d9a54f46e1109a6365')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_static" \
        "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
