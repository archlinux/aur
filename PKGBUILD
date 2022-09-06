# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joshua Cold <joshzcold@gmail.com>
pkgname=elasticvue-bin
pkgver=0.42.1
pkgrel=1
url="https://github.com/cars10/elasticvue"
license=('MIT')
arch=('x86_64')
source=(
	"https://github.com/cars10/elasticvue/releases/download/v${pkgver}/elasticvue_${pkgver}_linux_amd64"
	"https://github.com/cars10/elasticvue/raw/master/public/images/logo/white_96.png"
	"local://elasticvue.desktop"
)
sha256sums=(
	'6b5081d4b0c95f6749f9805f16d105d2e2cf6b91c0d7d7bc517682e4d6068f70'
	'900aacd175476c1047ccb41c461a189dfee21a6b419485de959c75fb557ff1a4'
	'eb925873677e844dc5cb45c7a69e08f11d9bd877539435ac258703a976903f0c'
)

package() {
	install -D -m644 white_96.png -T "${pkgdir}/usr/share/pixmaps/elasticvue.png"
	install -D -m644 elasticvue.desktop -T "${pkgdir}/usr/share/applications/elasticvue.desktop"
	install -D -m755 elasticvue_${pkgver}_linux_amd64 -T "${pkgdir}/usr/bin/elasticvue"
}
