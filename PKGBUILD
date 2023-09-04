# Maintainer: Arthur Deierlein <arthur.deierlein@adfinis.com>

pkgbase='python-rich-argparse'
pkgname=('python-rich-argparse')
_module='rich_argparse'
pkgver='1.3.0'
pkgrel=1
pkgdesc="Rich help formatters for argparse and optparse"
url="https://pypi.org/project/rich-argparse/"
depends=('python' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-hatchling')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('974cc1ba0aaa0d6aabc09ab1b78f9ba928670e08590f9551121bcbc60c75b74a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-rich-argparse/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
