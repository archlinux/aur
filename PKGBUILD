# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=5.4.31_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'    'dtkwidget' 'leveldb' 'poppler-qt5' 'libical')
provides=(${_pkgname})
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('bdd111cb89b7fd2fe2750ede64e20ecbd9eeb101a384795abca6a2dde6f5ceac567f02d63f3f5915babdcbafaff9237c44f18b0ada65c0bff3e8a6247e7d71dc')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    sed -i 's|libleveldb.so.1d|libleveldb.so\x0\x0\x0|g' ${pkgdir}/usr/bin/${_pkgname}
}
