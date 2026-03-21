#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-jupyterlite-pyodide-kernel'
_module='jupyterlite-pyodide-kernel'
pkgver='0.7.1'
_src_folder="jupyterlite_pyodide_kernel-${pkgver}"
pkgrel=1
pkgdesc="Python kernel for JupyterLite powered by Pyodide"
url="https://jupyterlite-pyodide-kernel.readthedocs.io/"
depends=('python' 'python-debugpy' 'jupyter-notebook-shim' 'python-rfc3339-validator' 'python-rfc3986-validator' 'jupyter-server' 'jupyter-lsp' 'jupyter-nbconvert' 'jupyter-server-mathjax' 'python-jupyter-events' 'python-jsonschema' 'python-isoduration' 'python-fqdn' 'python-webcolors' 'python-uri-template' 'python-rfc3987-syntax' 'python-bleach' 'python-tinycss2-1.4' 'python-tzdata' 'python-jsonpointer' 'python-ipywidgets' 'python-myst-parser' 'python-pydata-sphinx-theme' 'python-ruff')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pkginfo')
license=('custom:BSD License')
arch=('any')
source=("https://github.com/jupyterlite/pyodide-kernel/releases/download/v${pkgver}/jupyterlite_pyodide_kernel-${pkgver}.tar.gz")
sha256sums=('5e52c57190057d816e8551db1b2541f9c0398f71ea54ca47004886db6931cd6c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
