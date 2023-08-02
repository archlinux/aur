pkgname=micromamba-pycharm-git
pkgver=r5.4e38fb8
pkgrel=1
pkgdesc="Use Micromamba environments in PyCharm "
arch=('any')
url="https://github.com/jonashaag/micromamba-pycharm"
source=(git+https://github.com/jonashaag/micromamba-pycharm.git)
sha256sums=('SKIP')
conflicts=('python-conda')

pkgver() {
    cd micromamba-pycharm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd micromamba-pycharm
    install -Dm755 conda "${pkgdir}/usr/bin/conda"
}
