# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
_pkgname=deepin-mail
pkgver=6.4.8
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
sha512sums_x86_64=('e2894d5732251207f5de95730be49e24162dc7b8e13859014687f6936adcf1a87a15f06ec8eb5b491132c81764a6f3240b41b8c2ce6097c0472aac0dc65e6598')

package() {
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    patchelf ${pkgdir}/usr/bin/${_pkgname} --replace-needed libleveldb.so.1d libleveldb.so.1
}
