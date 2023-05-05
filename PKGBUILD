# Maintainer: desbma
pkgname=python-onvif-zeep-git
_gitname=python-onvif-zeep
pkgver=r115.d549eed
pkgrel=2
pkgdesc='ONVIF Client Implementation in Python '
arch=('any')
url="https://github.com/FalkTannhaeuser/${_gitname}"
license=('MIT')
conflicts=('python-onvif-zeep')
provides=('python-onvif-zeep')
depends=('python'
         'python-zeep')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/FalkTannhaeuser/${_gitname}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
