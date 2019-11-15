# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='statcode'
pkgname=('statcode')
_module='statcode'
pkgver='2.0.0'
pkgrel=2
pkgdesc='Man pages for HTTP status codes'
url='https://github.com/shobrook/statcode'
depends=(
    'python'
    'python-urwid'
    'python-yaml'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/source/s/statcode/statcode-2.0.0.tar.gz')
sha256sums=('cc22f598c2fb6e585d8718010c0e9d24716738ff64f0490830ec0c121372d58e')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
