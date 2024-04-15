# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Co-Maintainer: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors
pkgname=eric
pkgver=24.4
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=(
    'python-asttokens'
    'python-black'
    'python-coverage'
    'python-editorconfig'
    'python-isort'
    'python-pyqt6-charts'
    'python-pyqt6-webengine'
    'python-qscintilla-qt6'
    'python-semver'
    'python-tomlkit'
    'qt6-serialport'
    'qt6-svg'
    'qt6-tools'
    'qt6-websockets'
    )
makedepends=('python-pip')
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}7-${pkgver}.tar.gz")
sha256sums=('b11bd996b4089e496abfa7b6a86bb2bf5bfd403dc8c36d4958406af940f1523d')

package_eric() {
    cd "${pkgname}7-${pkgver}"

    python install.py -c -b "/usr/bin" -i "${pkgdir}"

    # fix paths in desktop files
    find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

