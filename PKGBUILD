# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=5.3.14_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'    'dtkwidget' 'leveldb')
provides=(${_pkgname})
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('97b373ab600f0ae5cd8e73f195ea331b8c96b6fb569e89a417e49f0bba8347160d1704829df077bcb4c636bb6626e4d5287a6348535bee66e816b1661940e5f6')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    sed -i 's|libleveldb.so.1d|libleveldb.so\x0\x0\x0|g' ${pkgdir}/usr/bin/${_pkgname}
}
