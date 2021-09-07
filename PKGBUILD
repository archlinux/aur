# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=websockify
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=0.10.0
pkgrel=1
pkgdesc="WebSockets support for any application/server"
arch=(any)
url="https://github.com/novnc/websockify"
license=(LGPL3)
makedepends=(
	python
	python-numpy
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('caf8152f7ecec6d28041b4d3e112dbb1')
sha256sums=('6c4cc1bc132abb4a99834bcb1b4bd72f51d35a08d08093a817646ecc226ac44e')
sha512sums=('1a4d1cbee8f6ddc6cf02d928a1bbc0753991b171dcaec54f3a9d6fafac6d77835d5480eb05006d98b4ff755e6ed1b8e618501f0116a99779823ebf84eb5f84e4')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
}

_package_python(){
	depends=(
		python
		python-numpy
	)
	conflicts=(websockify)
	provides=(websockify)
	replaces=(websockify)
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
