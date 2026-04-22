# Maintainer:
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.5.1
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=('any')
url="https://www.openshot.org"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme'
         'libopenshot'
         'libopenshot-audio'
         'python'
         'python-defusedxml'
         'python-distro'
         'python-opengl'
         'python-pillow'
         'python-pyqt5'
         'python-pyzmq'
         'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v${pkgver}.tar.gz")
sha512sums=('c7dbb408ede0f688abb1e59cc49e46f371bddba193b3c4d6c8e5f2ca76f58b7ab5646d482c080198a80068d04863af8c90b2bb39569afe90a4380afe3b0fecf8')
b2sums=('a9ba0ff3a5c5f9bb98962fe97070974de111a595a2bf3b63164a0c5ddf14a106105ddf925cc28b1ac9329feeba16617b048bcd08d22e0e57a46303b3588143ff')

build() {
    cd "${pkgname}-qt-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="${pkgdir}" "${pkgname}-qt-${pkgver}"/dist/*.whl
}
