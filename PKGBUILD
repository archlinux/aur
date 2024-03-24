# Maintainer: Romain Gallet <romain.gallet at gmail.com>
# Contributor: Romain Gallet <romain.gallet at gmail.com>
_packager="Romain Gallet <romain.gallet at gmail.com>"
pkgver=0.3
pkgname=sabnzbd-docker
pkgrel=2
pkgdesc='Convienience launch service for Sabnzd in docker'
arch=('x86_64')
license=('MIT')
groups=()
depends=('docker')
makedepends=()
checkdepends=()
optdepends=()
provides=()
backup=()
options=()
source=("file://sabnzbd-docker.service" "file://sabnzbd-docker-update.timer" "file://sabnzbd-docker-update.service" "file://docker-compose.yaml" "file://default.env")
md5sums=('94ffcf6e8447d6177fdafe8ec48dbb23'
         '6fd19f267a71ba90a6a4f3177570e416'
         '80456723536c022e86d7e1f9970792ef'
         '4a2c0fe817f64b3bd81577bef85d64e1'
         '8d223e192e5fb25de96ed7dc6fb0c8d1')
noextract=()


package() {
	mkdir -p ${pkgdir}/opt/docker-sabnzbd
	cp docker-compose.yaml ${pkgdir}/opt/docker-sabnzbd
	cp default.env ${pkgdir}/opt/docker-sabnzbd

	mkdir -p ${pkgdir}/etc/systemd/user/
	cp sabnzbd-docker.service ${pkgdir}/etc/systemd/user/
	cp sabnzbd-docker-update.service ${pkgdir}/etc/systemd/user/
	cp sabnzbd-docker-update.timer ${pkgdir}/etc/systemd/user/
}

