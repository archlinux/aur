# Maintainer: Anthony Wang <ta180m@pm.me>

pkgbase='python-jupyter-server-proxy'
pkgname=('python-jupyter-server-proxy')
_name='jupyter-server_proxy'
pkgver='3.2.1'
pkgrel=1
pkgdesc="Jupyter server extension to supervise and proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=('python' 'python-aiohttp' 'python-simpervisor' 'python-ipython-genutils' 'jupyter-nbclassic')
makedepends=('unzip' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('150124483df109eed8280b13ea78c1a417dd8f2b513b624aa7f1201424b8cdf8')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share"* "$pkgdir/usr/share"
        mv "$site/${_name/-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
