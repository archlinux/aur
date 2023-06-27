
_pkgname=minq-youtube
pkgname="${_pkgname}-git"
pkgver=r5.8efb00714b164c6580c2b92c39ac1c628d9a7d40
pkgrel=1
epoch=
pkgdesc='Terminal port of youtube. Automatically caches all network requests so that youtube can be enjoyed during an ISP outage.'
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
depends=(python python-pytube yt-dlp viu mpv)
makedepends=(git)
optdepends=(
	'wezterm: an example terminal that supports full image resolution'
	'kitty: an example terminal that supports full image resolution'
)
provides=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp minq_youtube.py "${pkgdir}/usr/bin/${_pkgname}"
	#install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
