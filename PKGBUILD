# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>

pkgname="yaoqiang-bpmn-editor"
_pkgver_major=4.1
_pkgver_minor=4
pkgver="${_pkgver_major}.${_pkgver_minor}"
pkgrel=1
pkgdesc="An open source graphical editor for business process diagrams, compliant with OMG specifications (BPMN 2.0)."
arch=(any)
url="http://bpmn.sourceforge.net/"
_curver_license="GPLv3"
license=('GPL3'
    'custom: "free for non-commercial use"')
depends=(java-environment)
source=('yaoqiang-bpmn-editor'
    'yaoqiang-bpmn-editor.desktop'
    'yaoqiang-bpmn-editor.png'
    "http://downloads.sourceforge.net/project/bpmn/${_pkgver_major}-${_curver_license}/${pkgname}-${pkgver}.zip")
sha256sums=('e07d0a5de0f58ae849db7f273df0625cfe45d3416ece0511968c7951177e3cd0'
    '58d987538c56e8e0b542dd025803230c25265cd45d6040f9f398cc68ab4ad7ac'
    '038fd8a5e1f9518645fdb8382d704ed5297b89350c5fcace9f63213edb6d380e'
    '10eae6f6550e78345c96c369217bef477f17d1c3725cd6ad29612badc67b54f7')

build() {
    # prepare the application files
    mkdir -p ${srcdir}/opt/${pkgname}
    cp -r ${srcdir}/yaoqiang-${pkgver}/* ${srcdir}/opt/${pkgname}
    cp ${srcdir}/${pkgname}.png ${srcdir}/opt/${pkgname}
    cp ${srcdir}/${pkgname} ${srcdir}/opt/${pkgname}
}

package() {
    # add the application files
    cp -r ${srcdir}/opt ${pkgdir}/opt

    # prepare and add the .desktop file
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
