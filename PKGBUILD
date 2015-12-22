# Maintainer: Christos Nouskas <nous at archlinux.us>

pkgname=fu-git
pkgver=r35.47c0867
pkgrel=2
pkgdesc="A simple python2 tool for querying commandlinefu.com"
url="https://github.com/samirahmed/fu"
arch=(any)
license=('MIT')
depends=('python2')
makedepends=('git' 'python2-setuptools')
_gitroot="git+https://github.com/samirahmed"
_gitname="fu"
source=(${_gitname}::${_gitroot}/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    python2 setup.py -q install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/fu" "${pkgdir}/usr/bin/fu.py"
}
