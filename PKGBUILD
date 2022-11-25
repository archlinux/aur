# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: hitori <hitori.gm at gmail dot com>

pkgname=decrypt-git
pkgver=r30.53a5a4f
pkgrel=1
pkgdesc="Pipe programs through decrypt to make your boss think you are l33t"
arch=('any')
url="https://github.com/jtwaleson/decrypt"
license=('MIT')
makedepends=('git' 'python-setuptools')
source=("decrypt-git::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
