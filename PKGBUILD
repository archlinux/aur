# Maintainer: Georgy Kulish <g.kulish@moyklass.com>

pkgname="anilabxmax-bin"
pkgver=1.2
pkgdesc="AniLabX MAX - PC app for watching anime/dramas/cartoons and reading manga/comics/light novels"
arch=('x86_64')
url="https://github.com/AniLabX/AniLabXMAX"
license=('unknown')
provides=('anilabxmax')
conflicts=('anilabxmax')
source=(
	"https://github.com/AniLabX/AniLabXMAX/releases/download/v1.2/AniLabXMAX_v${pkgver}_linux64"
	"https://anilabx.xyz/assets/media/hero.png"
	"anilabxmax.desktop")
sha256sums=(
	'1dc7b68d5b8a4bed63f7dea1984e01e791fd72b1f23e9e7f3d49bfecc91c6ac0'
	'52148e76e72b5746e3e03aa90dcaf546df5ec0dea5cce640d711c37b8c9fbb73'
	'df9869cb7455e2a09183e2e0ad7fee0649c814ea7480ebd2d5fef75626243885'
)
noextract=('AniLabXMAX_v${pkgver}_linux64')
pkgrel=1
depends=('glibc')

package() {
	install -Dm755 "${srcdir}/AniLabXMAX_v${pkgver}_linux64" "${pkgdir}/usr/bin/anilabxmax"
	install -Dm644 "${srcdir}/hero.png" "${pkgdir}/usr/share/pixmaps/anilabxmax.png"
	install -Dm644 "${srcdir}/anilabxmax.desktop" "${pkgdir}/usr/share/applications/anilabxmax.desktop"
}
