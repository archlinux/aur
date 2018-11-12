# Maintainer: Khorne <khorne at khorne dot me>
pkgbase=python-pygments-style-gruvbox-git
pkgname=('python-pygments-style-gruvbox-git' 'python2-pygments-style-gruvbox-git')
pkgver=r3.36ed771
pkgrel=2
pkgdesc="gruvbox style for pygments"
arch=('any')
url="https://github.com/daveyarwood/gruvbox-pygments"
license=('unknown')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("${pkgbase%-git}::git+https://github.com/daveyarwood/gruvbox-pygments.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgbase%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgbase%-git}"
    python setup.py build
    python2 setup.py build
}

package_python-pygments-style-gruvbox-git() {
    depends=('python-pygments')
    cd "${pkgbase%-git}"
    python setup.py install --root="${pkgdir}" --skip-build
}

package_python2-pygments-style-gruvbox-git() {
    depends=('python2-pygments')
    cd "${pkgbase%-git}"
    python2 setup.py install --root="${pkgdir}" --skip-build
}
