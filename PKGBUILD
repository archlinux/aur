#Maintainer: Ponies <marmabelle at gmail dot com>
pkgname=postman-cli
pkgver=1.9.0
pkgrel=1
pkgdesc="The Postman CLI is the command-line companion that is developed, supported, and signed by Postman. All test results will be automatically pushed to the app."
provides=('postman-cli')
arch=('x86_64')
options=("!strip")
url="https://www.postman.com/product/what-is-postman/"
license=('custom')
source=("postman-cli.tar.gz::https://dl-cli.pstmn.io/download/latest/linux64")
depends=(libxss nss)

sha256sums=('c553f03f8fb0ae589fe2be438036bae76e92b8af63114df23f4fdc41fe42ee82')
prepare(){
    cd "$srcdir"
    tar -xzf postman-cli.tar.gz
}
package() {
    install -dm755 "$pkgdir/usr/bin/"
    cp "${srcdir}/postman-cli" "${pkgdir}/usr/bin/"
}
