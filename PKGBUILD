# Maintainer : Marcin Dąbrowski <mardab@zoho.eu>

pkgname="yaoqiang-bpmn-editor"
_pkgver_major=5
_pkgver_minor=4
_pkgver_patch=0
pkgver_no_patch="${_pkgver_major}.${_pkgver_minor}"
pkgver="${_pkgver_major}.${_pkgver_minor}.${_pkgver_patch}"
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
    "https://downloads.sourceforge.net/project/bpmn/${_pkgver_major}-${_curver_license}/binaries/${pkgver_no_patch}/${pkgname}-${pkgver}.jar")
sha256sums=('72ef1b95536ab3064a0958388d92d18beefa8613cd72219d4adff24a7bc39743'
    '58d987538c56e8e0b542dd025803230c25265cd45d6040f9f398cc68ab4ad7ac'
    '038fd8a5e1f9518645fdb8382d704ed5297b89350c5fcace9f63213edb6d380e'
    '64ea0bcd983ddc771d95b0c925e26070d040358c4f38045fe34bdbde70af020e')

build() {
    # prepare the application files
    mkdir -p ${srcdir}/opt/${pkgname}
    cp ${srcdir}/${pkgname}* ${srcdir}/opt/${pkgname}
}

package() {
    # add the application files
    cp -r ${srcdir}/opt ${pkgdir}/opt

    # prepare and add the .desktop file
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
