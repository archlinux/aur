pkgname=home-assistant-service-pip
_serviceName=hass
pkgdesc='Self installing package of Home Assistant using pip'
pkgver=3
pkgrel=1
arch=('any')
url='https://home-assistant.io/'
license=(APACHE)
depends=(
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
sha256sums=('680ed79423fd66af3201c9eaf08abdbd0aea0ef1e9ca7fd89d182065117a06f6'
            '10c57fb89c0e70abb02adeb11ca276da230dc5e169134f0586a000bb135505e7'
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
