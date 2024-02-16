# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=solara
pkgname=python-${_name,,}
pkgver=1.27.0
pkgrel=1
pkgdesc="A pure Python, React-style web framework"
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
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_whl}")
sha256sums=('f3aca56b6ff316f94d7b69bce9563f3c9c4a6e20abd1a6ae4ac70b9fd431c6c1')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
