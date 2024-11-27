pkgname='python-mobi'
_module='mobi'
_src_folder='mobi-0.3.3'
pkgver='0.3.3'
pkgrel=1
pkgdesc="unpack unencrypted mobi files"
url="https://github.com/iscc/mobi"
depends=('python' 'python-loguru')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:GNU General Public License v3 (GPLv3)')
arch=('any')
source=("https://files.pythonhosted.org/packages/9a/a3/598cbedb115c555c34a5fa3172bc5a300ef9005485dda294fece76023beb/mobi-0.3.3.tar.gz")
sha256sums=('919f60c3834c5885012210afc84a03a457fb8e58587037060a095b63ac832524')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
