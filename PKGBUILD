# Maintainer: somini <dev@somini.xyz>

pkgname=python-rtpplayapi
_module='rtpplayapi'
pkgver=1.0.4
pkgrel=4
pkgdesc="An unofficial python api to fetch media from RTPPlay, based on their mobile API."
url="https://github.com/guipenedo/rtp-play-api"
depends=('python' 'python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2519aa024db297779943740fcc63c50b76634fe6ef6e6f773eed8e19b81af67d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
