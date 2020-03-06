# Maintainer: Yamada Hayao <shun819.mail@gmail.com>
# Contributor: YamaD <yamad.linuxer@gmail.com>

pkgname=plymouth-theme-alter-pp
_themename=alter-pp
_pkgname=plymouth-theme-alter
pkgver=1.0.0
pkgrel=1
pkgdesc="AlterLinux用のplymouthテーマ"
arch=('any')
url=https://github.com/yamad-linuxer/plymouth-theme-alter
license=('GPL')
depends=('plymouth')
optdepends=()
source=("${url}/archive/${pkgver}.zip")
md5sums=('6583b328581df987c6b22bfcc815dc13')
conflicts=('plymouth-theme-alter-pp-git')


prepare () {
    cd "${srcdir}"
    mv ${_pkgname}-${pkgver}/${_themename} ./
    rm -rf "${_pkgname}-${pkgver}"
    rm ./${pkgver}.zip
}

build () {
    cd "${srcdir}"
    mkdir -p ./usr/share/plymouth/themes/${_themename}/
    cp -r ./${_themename}/intro/* ./usr/share/plymouth/themes/${_themename}/
    cp -r ./${_themename}/loop/* ./usr/share/plymouth/themes/${_themename}/
    cp -r ./${_themename}/misc/* ./usr/share/plymouth/themes/${_themename}/

    rm -rf ${_themename}
}

package() {
    mkdir -p "$pkgdir"
    cp -r * "$pkgdir"
}
