# Maintainer: Kimiblock Moe

pkgname=yt-dlp-getpot-wpc-git

pkgdesc="An experimental PO Token Provider for yt-dlp using the browser to mint tokens"
url=https://github.com/coletdjnz/yt-dlp-getpot-wpc
license=(MIT)
arch=(any)
pkgver=r8.0d3e547
pkgrel=1
makedepends=(python-build python-installer python-wheel git python-packaging)
provides=(${pkgname} YT-DLP-GET-POT-PROVIDER)
depends=(python yt-dlp python-nodriver)


source=(
	"git+https://github.com/coletdjnz/yt-dlp-getpot-wpc.git"
)

sha256sums=(
	"SKIP"
)

function pkgver() {
	cd "${srcdir}/yt-dlp-getpot-wpc"
	#git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function build() {
	cd "${srcdir}/yt-dlp-getpot-wpc"
	#python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/yt-dlp-getpot-wpc"
	install -d "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-getpot-wpc
	cp -r yt_dlp_plugins "${pkgdir}"/etc/yt-dlp/plugins/yt-dlp-getpot-wpc
}
