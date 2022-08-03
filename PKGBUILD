# Maintainer: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=usql-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=('x86_64')
url='https://github.com/xo/usql'
license=('MIT')
options=('!strip')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/v${pkgver}/usql_static-${pkgver}-linux-amd64.tar.bz2"
    'LICENSE::https://github.com/xo/usql/raw/master/LICENSE')
sha256sums=('66170fa73751c997894dcbba1bf63a9a55f13e427159dcf706397fcadc1e64d5'
            'ab7cf54dcb0b4de0442aa073f93501b667dcfba13e7576d9a54f46e1109a6365')

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_static" \
        "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
