# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='textadept-common-git'
pkgver=20150118.8de20fb
pkgrel=1
pkgdesc="Some functions, key commands and modifications that change Textadept's default behaviour"
arch=('any')
url='https://rgieseke.github.io/ta-common/'
license=('MIT')
depends=('textadept')
makedepends=('git')
source=("https://github.com/rgieseke/ta-common/archive/master.tar.gz")
sha256sums=('SKIP')

pkgver() {
    cd 'ta-common-master'
    echo $(date +%Y%m%d).$(git ls-remote git://github.com/rgieseke/ta-common.git master | cut -c -7)
}

package() {
	mkdir -p "${pkgdir}/opt/textadept/modules/common"
	cp -r "ta-common-master/." "${pkgdir}/opt/textadept/modules/common/"
}
