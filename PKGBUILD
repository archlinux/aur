pkgname='python-wakepy'
_module='wakepy'
_src_folder='wakepy-0.10.2.post1'
pkgver='0.10.2.post1'
pkgrel=1
pkgdesc="wakelock / keep-awake / stay-awake"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/e8/26/caf88d7975e1b6e181d91cbb624b63b3a455231aff50eb2cba206c7e7bd9/wakepy-0.10.2.post1.tar.gz")
sha256sums=('c968b8b7061d30ab193747ce7fb5226bc61c26b005e4a2792a19211f83cf71ac')

build() {
    cd "${srcdir}/${_src_folder}"
    sed -i 's/setuptools\=\=/setuptools>=/g' pyproject.toml
    sed -i 's/setuptools_scm\=\=/setuptools_scm>=/g' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
