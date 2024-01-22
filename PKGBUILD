pkgname=home-assistant-service-pip
_serviceName=hass
pkgdesc='Self installing package of Home Assistant using pip'
pkgver=9
pkgrel=2
arch=('any')
url='https://home-assistant.io/'
license=(APACHE)
depends=(
	gcc
	pkgconf
	python-aiodiscover
	python-aiohttp
	python-aiohttp-cors
	python-astral
	python-async-timeout
	python-atomicwrites
	python-attrs
	python-awesomeversion
	python-bcrypt
	python-build
	python-certifi
	python-ciso8601
	python-cryptography
	python-dateutil
	python-defusedxml
	python-fnvhash
	python-httpx
	python-ifaddr
	python-installer
	python-jinja
	python-lru-dict
	python-mutagen
	python-orjson
	python-pillow
	python-pip
	python-pynacl
	python-pyjwt
	python-pytz
	python-requests
	python-ruamel-yaml
	python-slugify
	python-sqlalchemy
	python-typing_extensions
	python-voluptuous
	python-voluptuous-serialize
	python-wheel
	python-yaml
	python-yarl
	python-zeroconf
	python-setuptools
	python
	rust
)
optdepends=(
	'net-tools: Nmap host discovery'
	'openzwave: Z-Wave integration'
)
source=("${_serviceName}.service" "${_serviceName}-update.service" "${_serviceName}.sysusers" "${_serviceName}.tmpfiles" "${_serviceName}.env")
sha256sums=('c4d15648e7e325b6f695c528912ec6f440064efde44715d81a8f3dd6d4210ef8'
            'dcb49d199f54e54d6cdae305ce6b83d896ccc3c0750a9f14df292812d424f0eb'
            'ee49a7bb8ce2cf2bb34f53708d205aea4e16c25c1cb9d3925d562286ab499852'
            'ac019d391343821e63039b0f55eb7d5129acb3e3a04e7c3fb47870a773e3079b'
            '6532f9bd1027f7c40f825d95d6cf5b7ca0ea8be9c71c173f02490a49e07572f4')
backup=("etc/${_serviceName}.env")
install="${_serviceName}.install"
provides=('home-assistant')

package() {
	install -Dvm 644 "${srcdir}/${_serviceName}.service" "${pkgdir}/usr/lib/systemd/system/${_serviceName}.service"
	install -Dvm 644 "${srcdir}/${_serviceName}-update.service" "${pkgdir}/usr/lib/systemd/system/${_serviceName}-update.service"
	install -Dvm 644 "${srcdir}/${_serviceName}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_serviceName}.conf"
	install -Dvm 644 "${srcdir}/${_serviceName}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_serviceName}.conf"
	install -Dvm 644 "${srcdir}/${_serviceName}.env" "${pkgdir}/etc/${_serviceName}.env"
}
