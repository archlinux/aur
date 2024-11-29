_module='kthread'
pkgname=python-$_module
_src_folder='kthread-0.2.3'
pkgver='0.2.3'
pkgrel=1
pkgdesc="Killable threads in Python!"
url="https://github.com/munshigroup/kthread"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/18/9b/aa1b48c3cf6e1a914ee5eee1fed77cd7217fb0a35c07c345da4ec5215cae/kthread-0.2.3.tar.gz")
sha256sums=('90e194e6a7ff903040c4133d3ea9037c908c4296bf5f582c7fdcf6325a04f9b4')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
