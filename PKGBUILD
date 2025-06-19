# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Co-Maintainer: derchef <mjindra (at) derchef (dot) email>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Brad Fanella <bradfanellaat archlinux dot us>
# See .contrib for older/other contributors
pkgname=eric
pkgver=25.6.1
pkgrel=1
pkgdesc="A full-featured Python and Ruby IDE in PyQt"
arch=('any')
url="https://${pkgname}-ide.python-projects.org/"
license=('GPL3')
depends=(
    )
makedepends=('python-pip')
optdepends=(
    )
conflicts=(${pkgname}-common)
replaces=(${pkgname}-common)
source=("https://downloads.sourceforge.net/${pkgname}-ide/${pkgname}7-${pkgver}.tar.gz")
sha256sums=('e06b3c266f149f4b26eb2a8c10492e38729669cdcfd195c9a336419b99ea1dbf')

package_eric() {
    cd "${pkgname}7-${pkgver}"

    python3 -m venv eric_venv

    source "$(pwd)/eric_venv/bin/activate"


    python3 -m pip install --upgrade pip
    python3 -m pip install --prefer-binary eric-ide
    eric7_post_install
}
