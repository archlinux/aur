# Maintainer: Anthony Wang <a_at-exozy_dot-me>

pkgbase='python-jupyter-server-proxy'
pkgname=('python-jupyter-server-proxy')
_name='jupyter-server_proxy'
pkgver='4.0.0'
pkgrel=1
pkgdesc="Jupyter server extension to supervise and proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=('python' 'python-aiohttp' 'python-simpervisor')
makedepends=('unzip' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('8075afce3465a5e987e43ec837c307f9b9ac7398ebcff497abf1f51303d23470')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share"* "$pkgdir/usr/share"
	mv "$site/${_name/-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
