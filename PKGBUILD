# Maintainer: Jorge Pizarro-Callejas <jpizarrocallejas@gmail.com>

pkgname=nodejs-ngrok
_pkgname=ngrok
pkgver=4.3.1
pkgrel=1
pkgdesc="Node.js module and implementation of ngrok"
arch=(any)
url="https://github.com/bubenshchykov/ngrok"
license=('BSD-2-Clause')
depends=('nodejs')
makedepends=('npm')
provides=('ngrok')
conflicts=('ngrok')
source=("http://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=(${_pkgname}-${pkgver}.tgz)
sha256sums=('a76c5fc9d623ed3718817b9549de1a5a0d140ae449961e75019964f1850634a9')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir"/${_pkgname}-${pkgver}.tgz

    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
