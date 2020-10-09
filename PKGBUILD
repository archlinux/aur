# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Modification on top of DejaVu Sans Mono making it more suitable for coding'
pkgname=ttf-brutalist-mono
pkgver=2.1
pkgrel=1
url=https://github.com/BRUTALISM/Brutalist
license=(custom)
arch=(any)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/BrutalistMono.zip"
        "${pkgname}-${pkgver}-LICENSE::https://github.com/BRUTALISM/Brutalist/raw/master/LICENSE")
sha512sums=('a13965fe748ad4474901f92802112cc3c0438f0f5f2d2a6d60ca11fab5465648082b4535989cf8765d93caf0df55fe1374ccc4bb1a3877bc057e4f6775134019'
            '160ed3170edd80dace8c8a9d04da163b0682909ac154e97e59d989ba2c678cdef071d9eb3bc3161f5b243389bb27a15b93ede4d0190a3314adab05755df56f45')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" "${srcdir}"/*.ttf

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
