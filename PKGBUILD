# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-datalad
_pkgname=datalad
pkgver=0.14.7
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex '
arch=('any')
url='https://github.com/datalad/datalad'
license=('MIT')
depends=('python' 'git-annex' 'python-msgpack' 'python-appdirs' 'python-simplejson' 'python-chardet' 'python-wrapt' 'python-secretstorage' 'python-iso8601' 'python-fasteners' 'python-whoosh' 'python-pygithub' 'python-jsmin' 'python-keyrings-alt' 'python-boto' 'python-annexremote' 'python-humanize' 'patool' 'python-requests' 'python-tqdm' 'python-keyring' 'python-gitpython')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/datalad/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6372c7fa7913f1719e00cf870b638ee5555c33402cd4fc3c21c16b11875dc9e3701f74cf3ea582dfc7b2faae415d47fa3e557855c5ede3db9af7adcb61cfca45')

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

