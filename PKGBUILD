# Maintainer: Popolon <popolon@popolon.org>

pkgbase='python-jupyterlite'
pkgname=('python-jupyterlite')
_module='jupyterlite'
pkgver=0.6.3
pkgrel=1
pkgdesc="tools for building JupyterLite sites"
url="https://github.com/jupyterlite/jupyterlite"
depends=('python' 'python-cloudpickle' 'python-doit' 'python-entrypoints' 'python-jupyter_core' 'python-traitlets')
optdepends=(
'jupyter-server: jupyter_server for contents API indexing'
'python-tornado: tornado for better local previewing with `serve`'
'python-pkginfo: pkginfo for reading wheel metadata for the pyolite kernel'
'jupyter-server-mathjax: reuse the MathJax assets from jupyter-server-mathjax'
'python-jsonschema: validate more data with jsonschema'
'jupyterlab: extensible environment for interactive and reproducible computing, based on the Jupyter Notebook and Architecture'
)
makedepends=('python-pip' 'python-wheel' 'python-flit' 'python-installer')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('d37a2b98eb15e319d7df56c0e2f535d72bd06eabe13e2f180e13cf8e26b9eeab')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
