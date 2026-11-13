# Maintainer: Arnob90 <arnob8066@gmail.com>
pkgname=sub-extractor
pkgver=0.1.0
pkgrel=1
pkgdesc="Download YouTube subtitles (json3) and print them as plaintext."
arch=("any")
url="https://github.com/Arnob90/youtube-subtitle-extractor"
license=("MIT")
depends=("python" "yt-dlp")
makedepends=("python-build" "python-installer" "python-uv-build" "git")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

build() {
	cd "${srcdir}/${pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
