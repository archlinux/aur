# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-hyprcursors
pkgver=2.1.0
pkgrel=2
pkgdesc="Hyprcursor port of https://github.com/alvatip/Nordzy-cursors."
arch=(any)
url="https://github.com/guillaumeboehm/Nordzy-hyprcursors"
license=('GPL3')
source=(
    "Nordzy-hyprcursors_${pkgver}.tar.gz::${url}/releases/download/${pkgver}/Nordzy-hyprcursors.tar.gz"
    "Nordzy-hyprcursors-white_${pkgver}.tar.gz::${url}/releases/download/${pkgver}/Nordzy-hyprcursors-white.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "a8ced4bc9218a6dadee876d0ce4889323c329645d06bea988c45f5ba81a1927e"
    "52bb20aa1f646d16b9c5b7dec26b94cc33219d0cfc14fbfef186a3a120cb9d12"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white"

	tar --no-same-owner -zxvf "Nordzy-hyprcursors_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
}
