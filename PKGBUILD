# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='powerline-kubernetes'
pkgname=('powerline-kubernetes')
_module='powerline-kubernetes'
pkgver='1.2.0'
pkgrel=1
pkgdesc="A Powerline segment to show Kubernetes context"
url="https://github.com/so0k/powerline-kubernetes"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f635f648b3e0249fe7491996c5a681ead8868b9bfa0254dde8811fe2919a9711')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
