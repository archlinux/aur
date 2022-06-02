# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=5.4.3_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'    'dtkwidget' 'leveldb' 'poppler-qt5' 'libical')
provides=(${_pkgname})
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('4f65aaf3365d236f19c376b742451fe048e8e937df7b6c7044933863bdd178cb82616a9aca577811bb3be263eac9ea5fe68c134a21664e7803b13c3eef134a7f')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    sed -i 's|libleveldb.so.1d|libleveldb.so\x0\x0\x0|g' ${pkgdir}/usr/bin/${_pkgname}
}
