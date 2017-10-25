# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=torbrowser-launcher
pkgname=$gitname-git
pkgver=0.2.8
pkgrel=1
pkgdesc='Securely and easily download, verify, install, and launch Tor Browser'
url=https://github.com/micahflee/$gitname
arch=('any')
license=('BSD')
makedepends=(git)
depends=(fakeroot gnupg pygtk python-gnupg python-twisted tor xz)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --tags | sed 's|-|\.|g;s/v//g')"
    printf "%s" "${ver//-/.}"
}

package() {
    cd "${srcdir}/${gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
