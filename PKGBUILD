# Maintainer: Anthony Wang <a_at-exozy_dot-me>

pkgbase='python-jupyter-server-proxy'
pkgname=('python-jupyter-server-proxy')
_name='jupyter-server_proxy'
pkgver='4.1.0'
pkgrel=1
pkgdesc="Jupyter server extension to supervise and proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=('python' 'python-aiohttp' 'python-simpervisor')
makedepends=('unzip' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('3a417d6996e47a90ba5ec5dd2603887cfd2efbc4abf850a1a0fbe77e3b4d04e9')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "${_name//-/_}-$pkgver-py3-none-any.whl" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share"* "$pkgdir/usr/share"
	mv "$site/${_name/-/_}-$pkgver.data/data/etc"* "$pkgdir/etc/"
}
