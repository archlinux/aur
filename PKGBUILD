pkgname=home-assistant-service-pip
_serviceName=hass
pkgdesc='Self installing package of Home Assistant using pip'
pkgver=6
pkgrel=2
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
	python-wheel
	python-yaml
	python-yarl
	python-zeroconf
	python
	rust
)
optdepends=(
	'net-tools: Nmap host discovery'
	'openzwave: Z-Wave integration'
)
source=("${_serviceName}.service" "${_serviceName}-update.service" "${_serviceName}.sysusers" "${_serviceName}.tmpfiles" "${_serviceName}.env")
sha256sums=('927203a5ef14fa74ff14e089a31ee9f24b750b4b939ef402f350b85df976f6dd'
            'f1a47e94b6c85571dc2a2aec8a917f85692f77d7c4ff3063f4676c5b062988c8'
            'ee49a7bb8ce2cf2bb34f53708d205aea4e16c25c1cb9d3925d562286ab499852'
            'ac019d391343821e63039b0f55eb7d5129acb3e3a04e7c3fb47870a773e3079b'
            '635bd69c105ee08fe3b60c613519dcc10833288c9c04536dbe0dedf50f3e12d0')
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
