# Maintainer: Midov <midov@midov.pl>

pkgname=pantalaimon
pkgver=0.3
pkgrel=4
pkgdesc='Pantalaimon is an end-to-end encryption aware Matrix reverse proxy daemon.'
arch=('any')
url='https://github.com/matrix-org/pantalaimon'
license=('Apache')
depends=('python' 'libolm' 'python-nio' 'python-prompt_toolkit' 'python-janus' 'python-peewee' 'python-logbook' 'python-aiohttp' 'python-cachetools' 'python-pycryptodome' 'python-unpaddedbase64' 'python-h2' 'python-h11' 'python-notify2' 'python-pydbus' 'python-olm' 'python-jsonschema' 'python-atomicwrites' 'python-click' 'python-keyring' 'python-future')
source=("https://github.com/matrix-org/pantalaimon/archive/${pkgver}.tar.gz"
        "${pkgname}.service")
sha256sums=('23030e5f8ef9c5e7770cb470c3320822024615ee2ee3d7f54dbb1c7701d1f427'
            'cf693e0324a7f2965bc9e64ab2c3d75137e7993503ddb3ae3dddc84af6c0b0e9')

build() {
	cd "${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir"
	install -D -m 644 "${srcdir}/pantalaimon.service" ${pkgdir}/usr/lib/systemd/user/pantalaimon.service
}

