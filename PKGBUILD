# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=archlinux-wallpapers-mixbranding
pkgver=0.2
pkgrel=1
pkgdesc="Wallpapers who are not what they seems to be"
url='https://gitlab.com/fabis_cafe/archlinux-wallpapers-mixbranding'
arch=('any')
license=('costum')
makedepends=('git')
install=$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install
_commit=969d46b9a244e5bc4b44bdff006b3c6e5e847096  # tags/0.2^0
source=("git+https://gitlab.com/fabis_cafe/archlinux-wallpapers-mixbranding.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
	# install license
	install -Dm 644 "${srcdir}/${pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install wallpapers
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-amz.svg" \
		"${pkgdir}/usr/share/backgrounds/archlinux-mixbranding/archlinux-amz.svg"
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-eg.svg" \
		"${pkgdir}/usr/share/backgrounds/archlinux-mixbranding/archlinux-eg.svg"
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-nf.svg" \
		"${pkgdir}/usr/share/backgrounds/archlinux-mixbranding/archlinux-nf.svg"
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-ph.svg" \
		"${pkgdir}/usr/share/backgrounds/archlinux-mixbranding/archlinux-ph.svg"

	# install gnome-shell compatiblity
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-mixbranding-timed.xml" \
		"${pkgdir}/usr/share/backgrounds/archlinux-mixbranding/archlinux-mixbranding-timed.xml"
	install -Dm 644 "${srcdir}/${pkgname}/archlinux-mixbranding.xml" \
		"${pkgdir}/usr/share/gnome-background-properties/archlinux-mixbranding.xml" 
}
