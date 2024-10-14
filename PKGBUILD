# Maintainer: Kimiblock Moe

pkgname=yt-dlp-youtube-oauth2-git

provides=(yt-dlp-youtube-oauth2)

pkgdesc="Plugin that adds OAuth2 login support to yt-dlp's YouTube extractors"
url=https://github.com/coletdjnz/yt-dlp-youtube-oauth2
license=(LicenseRef-none MIT)

arch=(any)
pkgver=2024.9.29.r0.g67ca8d64
pkgrel=1
makedepends=(python-build python-installer python-wheel git python-packaging)

depends=(python yt-dlp)

source=(
	"git+https://github.com/coletdjnz/yt-dlp-youtube-oauth2.git"
)

sha256sums=(
	"SKIP"
)

function pkgver() {
	cd "${srcdir}/yt-dlp-youtube-oauth2"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build() {
	cd "${srcdir}/yt-dlp-youtube-oauth2"
	#python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/yt-dlp-youtube-oauth2"
	#python -m installer --destdir="${pkgdir}" dist/*.whl
	install -d "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-youtube-oauth2
	cp -r yt_dlp_plugins "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-youtube-oauth2
}
