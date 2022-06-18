# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Co-Maintainer: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors
pkgname=eric
pkgver=22.6
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=('python-qscintilla-qt6' 'python-pyqt6-webengine' 'python-pyqt6-charts' 'qt6-tools' 'qt6-svg' 'python-editorconfig' 'python-asttokens')
makedepends=('python-pip')
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}7-${pkgver}.tar.gz")
sha256sums=('b8d5238cadba378e64c57a166b68a08602c38347ef3d10af49172c9cbe9779cf')

package_eric() {
    cd "${pkgname}7-${pkgver}"

    python install.py -c -b "/usr/bin" -i "${pkgdir}"

    # fix paths in desktop files
    find "${pkgdir}" -name '*.desktop' -exec sed -i "s|${pkgdir}||g" {} \;
}

