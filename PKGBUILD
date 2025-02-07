# Maintainer: Kimiblock Moe

pkgname=yt-dlp-get-pot

pkgdesc="An experimental plugin framework for yt-dlp to support fetching PO Tokens from external providers"
url=https://github.com/coletdjnz/yt-dlp-get-pot
license=(Unlicense)
arch=(any)
pkgver=0.3.0
pkgrel=1
makedepends=(python-build python-installer python-wheel git python-packaging)

depends=(python yt-dlp YT-DLP-GET-POT-PROVIDER)


source=(
	"git+https://github.com/coletdjnz/yt-dlp-get-pot.git#tag=v${pkgver}"
)

sha256sums=(
	"SKIP"
)

function build() {
	cd "${srcdir}/yt-dlp-get-pot"
	#python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/yt-dlp-get-pot"
	install -d "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-get-pot
	cp -r yt_dlp_plugins "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-get-pot
}
