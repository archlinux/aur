# Maintainer: Monika Schrenk <moni@random-access.org>
# Maintainer: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>

pkgname=studio-3t
pkgver=2018.4.4
pkgrel=1
pkgdesc="The professional workspace for MongoDB (formerly known as MongoChef)"
arch=('i686' 'x86_64')
url="https://studio3t.com"
license=("custom")
depends=('java-runtime-openjdk=8' 'java-openjfx' 'gtk2')
makedepends=('unzip')
provides=('studio-3t')
replaces=('mongochef')

source_i686=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x86-no-shell.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x64.tar.gz")
            
sha256sums_i686=('da954b206e4d4a2c31f3f297c15de1e3557d7110d4d479c3882fb2ec07d39a64')
sha256sums_x86_64=('e4ec05cf9da4ea3e22631c1eee96cb738f34064d62c6d8792041015b1dca4da8')

prepare() {
    tar zxvf ${pkgname}-${pkgver}.tar.gz && for file in *.sh; do mv "$file" ${pkgname}.sh; done && chmod +x ${pkgname}.sh
}

package() {
    sudo ./${pkgname}.sh
}
