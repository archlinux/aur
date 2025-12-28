#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tuned by hand

pkgname='python-jupyterlite-p5-kernel'
_module='jupyterlite-p5-kernel'
_src_folder='jupyterlite_p5_kernel-0.3.0'
pkgver='0.3.0'
pkgrel=3
pkgdesc="A p5.js jupyterlite kernel running in the browser"
url="https://jupyterlite.github.io/p5-kernel/"
depends=('python' 'python-rfc3339-validator' 'python-rfc3986-validator' 'jupyterlab' 'jupyter-server' 'jupyter-lsp' 'jupyter-nbconvert' 'python-jupyterlite-core' 'python-tinycss2-1.4' 'python-isoduration' 'python-tzdata' 'python-jsonpointer' 'python-uri-template' 'python-fqdn' 'python-terminado' 'python-rfc3987-syntax' 'python-debugpy' 'python-hatch-nodejs-version' 'python-hatch-jupyter-builder')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:BSD License')
arch=('any')
source=("https://files.pythonhosted.org/packages/6e/c5/e2d6f97f73cc368a802492a1e037950e56be11050e60ad62252669ec7343/jupyterlite_p5_kernel-0.3.0.tar.gz")
sha256sums=('293974231974eef8d08eed6083a9ab6f3f2a9f18bd35cf98d9262d2ab8570fc6')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
