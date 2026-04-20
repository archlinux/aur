# Maintainer: Guillaume BOEHM <aur@mail.gboehm.com>
pkgname=nordzy-hyprcursors
pkgver=2.5.0
pkgrel=1
pkgdesc="Hyprcursors from https://github.com/guillaumeboehm/Nordzy-cursors."
arch=(any)
url="https://gitlab.com/gboehm/Nordzy-cursors"
license=('GPL3')
_giturl='https://gitlab.com/gboehm/Nordzy-cursors'
source=(
    "Nordzy-hyprcursors_${pkgver}.tar.gz::${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-hyprcursors.tar.gz"
    "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz::${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-hyprcursors-lefthand.tar.gz"
    "Nordzy-hyprcursors-white_${pkgver}.tar.gz::${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-hyprcursors-white.tar.gz"
    "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz::${_giturl}/-/releases/v${pkgver}/downloads/Nordzy-hyprcursors-white-lefthand.tar.gz"
)
noextract=("${source[@]##*/}")
sha256sums=(
    "6034903683f28b428bdbb929b3666a6c6994c38790642ee09080799012cd8662"
    "96aa5c1eed8658d9e686ac62aacb63b25448f04aeb3f14e20fc9c53b2c20709d"
    "4120eed9a285c69aa62fbc470a32164002c199475ed926ba762656862146b1f6"
    "e5cac5e780d5d533a6f0ed8affe3ee69b668c96be6437ee25d2dd118868d80c2"
)

package() {
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-lefthand"
	install -dm755 "${pkgdir}/usr/share/icons/Nordzy-hyprcursors-white-lefthand"

	tar --no-same-owner -zxvf "Nordzy-hyprcursors_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
	tar --no-same-owner -zxvf "Nordzy-hyprcursors-white-lefthand_${pkgver}.tar.gz" -C "${pkgdir}/usr/share/icons/"
}
