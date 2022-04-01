# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=5.3.22_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'    'dtkwidget' 'leveldb')
provides=(${_pkgname})
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('2bc3e39a73a5a1a44a2dfb95df6b92bf15ec6d84b2c8ef9f9105f263512acf0972fc8175186cd8bab033318673320ed4a8f6029530ac7bddc483b625694766bb')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    sed -i 's|libleveldb.so.1d|libleveldb.so\x0\x0\x0|g' ${pkgdir}/usr/bin/${_pkgname}
}
