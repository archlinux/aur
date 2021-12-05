# Maintainer: Anthony Wang <ta180m@pm.me>

pkgbase='python-jupyter-server-proxy'
pkgname=('python-jupyter-server-proxy')
_name='jupyter-server_proxy'
pkgver='3.1.0'
pkgrel=4
pkgdesc="Jupyter server extension to supervise and proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=('python' 'python-aiohttp' 'python-simpervisor')
makedepends=('unzip' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('b57f5bce4c1004a648195314a4b243abeaee72f89a84b941c9f5eb3e8612d69c')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share"* "$pkgdir/usr/share"
        mv "$site/${_name/-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
