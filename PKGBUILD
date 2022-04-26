# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=5.4.1_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'    'dtkwidget' 'leveldb')
provides=(${_pkgname})
source_x86_64=("https://com-store-packages.uniontech.com/appstore/pool/appstore/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('4d01dc191a0af652787cf8513c1e5f99e72039ffa5fc313322ca3e46fe6872be8423986c86138ec4aad12b8ecdd139357faa897137abdc8ed3a3ed115bef4bb1')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    sed -i 's|libleveldb.so.1d|libleveldb.so\x0\x0\x0|g' ${pkgdir}/usr/bin/${_pkgname}
}
