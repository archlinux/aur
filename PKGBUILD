# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Co-Maintainer: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors
pkgname=eric
pkgver=22.4
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=('python-qscintilla-qt6' 'python-pyqt6-webengine' 'python-pyqt6-charts' 'qt6-svg' 'python-editorconfig' 'python-asttokens')
makedepends=('python-pip')
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}7-${pkgver}.tar.gz")
sha256sums=('420d04388ef365f6d886975b29e37d7bd8aa7fdcd9e4f18187adacb5a31f105b')

package_eric() {
    cd "${pkgname}7-${pkgver}"

    python install.py -c -b "/usr/bin" -i "${pkgdir}"

    # fix paths in desktop files
    find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

