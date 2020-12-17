# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-imgz-cli'
pkgname=('python-imgz-cli')
_module='imgz_cli'
pkgver='0.1.1'
pkgrel=1
pkgdesc="A command-line utility for IMGZ, the no-bullshit image hosting service."
url="https://gitlab.com/stavros/imgz-cli"
depends=('python' 'python-requests' 'python-pyperclip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
md5sums=('2eae4a96aef549718e936b2759139d31')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m setuptools.launch setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m setuptools.launch setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
