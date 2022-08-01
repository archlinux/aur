pkgname=home-assistant-service-pip
_serviceName=hass
pkgdesc='Self installing package of Home Assistant using pip'
pkgver=5
pkgrel=1
arch=('any')
url='https://home-assistant.io/'
license=(APACHE)
depends=(
	gcc
	python-aiohttp
	python-aiohttp-cors
	python-astral
	python-async-timeout
	python-attrs
	python-awesomeversion
	python-bcrypt
	python-certifi
	python-ciso8601
	python-cryptography
	python-defusedxml
	python-httpx
	python-jinja
	python-mutagen
	python-pillow
	python-pip
	python-pyjwt
	python-pytz
	python-requests
	python-ruamel-yaml
	python-slugify
	python-sqlalchemy
	python-voluptuous
	python-voluptuous-serialize
	python-yaml
	python-yarl
	python-zeroconf
	python
)
optdepends=(
	'net-tools: Nmap host discovery'
	'openzwave: Z-Wave integration'
	'python-dtlssocket: Ikea Tradfri integration'
	'python-lxml: Meteo France integration'
)
source=("${_serviceName}.service" "${_serviceName}-update.service" "${_serviceName}.sysusers" "${_serviceName}.tmpfiles" "${_serviceName}.env")
sha256sums=('548860a0b1eac13c062afb286f4a971f27a9a41d10d9923d5486dc99d76cc5d7'
            '7c0e470b4af90c1518998ef9e9000c0a015dedf7d16f15f3e4831737262589ee'
            'ee49a7bb8ce2cf2bb34f53708d205aea4e16c25c1cb9d3925d562286ab499852'
            'ce1491f82b257f915d41f9556636bb2a924d95c8ae6e0e85188c2b15849f82de'
            '0418c572087bfd0c7946b1cf662619e58c09b4c4972d1e705354fe26b38e4a7c')
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
