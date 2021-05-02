# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-datalad
_pkgname=datalad
pkgver=0.14.3
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex '
arch=('any')
url='https://github.com/datalad/datalad'
license=('MIT')
depends=('python' 'git-annex' 'python-msgpack' 'python-appdirs' 'python-simplejson' 'python-chardet' 'python-wrapt' 'python-secretstorage' 'python-iso8601' 'python-fasteners' 'python-whoosh' 'python-pygithub' 'python-jsmin' 'python-keyrings-alt' 'python-boto' 'python-annexremote' 'python-humanize' 'patool' 'python-requests' 'python-tqdm' 'python-keyring' 'python-gitpython')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/datalad/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2c4f4433069380e753c0f2f161793f6c6cf98c47acdbcdc1d510f4e6795bebb81fc19a41b78db8581038f91704d1b32918c50a4a71f9d2895139c1690b88e972')

build()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
  	python setup.py build
}


package()
{
  	cd "$srcdir/${_pkgname}-$pkgver"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
    # install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

