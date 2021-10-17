# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-datalad
_pkgname=datalad
pkgver=0.15.2
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex '
arch=('any')
url='https://github.com/datalad/datalad'
license=('MIT')
depends=('python' 'git-annex' 'python-msgpack' 'python-appdirs' 'python-simplejson' 'python-chardet' 'python-wrapt' 'python-secretstorage' 'python-iso8601' 'python-fasteners' 'python-whoosh' 'python-pygithub' 'python-jsmin' 'python-keyrings-alt' 'python-boto' 'python-annexremote' 'python-humanize' 'patool' 'python-requests' 'python-tqdm' 'python-keyring' 'python-gitpython')
makedepends=('python-setuptools')
optdepends=()
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/datalad/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f0206855439c2d376172218ec6bf1ffa3277508256a5a49a2ec65a57bb5720e039481329c16459ed62eb1c9ed0126dc178ca34fa2c3b8dfdf8b8a0706a2b8658')

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

