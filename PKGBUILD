# Maintainer: Juan Perez gatitofeliz at protonmail at com

pkgname=audacity-extras
pkgver=2.2.1
pkgrel=1
pkgdesc="All nyquist plugins for audacity"
arch=('any')
depends=('audacity')
url="localhost:43110"
license=('GPL2')
source=(
	"git+https://github.com/triceratops1/audacity-plugin.git"
)

sha384sums=(
	'SKIP'
)

package() {
	cd "${srcdir}/audacity-plugin"
	rm notch.ny
	mkdir -p "${pkgdir}/usr/share/audacity/plug-ins"
	for file in ${srcdir}/audacity-plugin/*.ny
	do
		install -D -m644 "${file}" "${pkgdir}/usr/share/audacity/plug-ins/"
	done
	}

