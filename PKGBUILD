# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=solara
pkgname=python-${_name,,}
pkgver=1.22.0
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python 3+"
arch=('any')
url="https://solara.dev"
license=(MIT)
depends=('python>=3.8'
          python-cachetools
	 'python-click>=7.1.0'
	  python-filelock
	  python-ipykernel
	 'python-ipyvue>=1.9.0'
	 'python-ipyvuetify>=1.8.10'
	  python-ipywidgets
	  python-jinja
	 'python-jupyter-client>=7.0.0'
	  python-markdown
	  python-markupsafe
	  jupyter-nbformat
	  pymdown-extensions
	 'python-reacton>=1.7.1'
	  python-requests
	  python-rich-click
	  python-starlette
	  uvicorn
	  python-watchdog
	  python-websockets
)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('025fb1dd03c12ad0bf43f6c3ea83beda5cbe9ef4ebccc4a9c462833d55b0c893')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
}
