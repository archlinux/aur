# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=6.4.10
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=(
    'qt5-webengine' 'dtkwidget' 'leveldb'
    'poppler-qt5' 'libical'
    'kglobalaccel5' 'ki18n5'
    'libytnef' 'deepin-qt-dbus-factory' 'sqlcipher'
)
makedepends=(patchelf)
provides=(${_pkgname})
source_x86_64=("https://mirrors.bfsu.edu.cn/deepin/beige/pool/commercial/d/deepin-mail/deepin-mail_${pkgver}_amd64.deb")
sha512sums_x86_64=('0106fe892fe71e58576b0b2609094952657c0c04abf5287fc2e0aa4d3a4c11457f6ffa3a8543f7e0cf115e5abcd6cc4372f5cc7e6bf3ae1102bb771ec6977d72')

package() {
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    patchelf ${pkgdir}/usr/bin/${_pkgname} --replace-needed libleveldb.so.1d libleveldb.so.1
}
