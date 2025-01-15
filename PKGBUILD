# Maintainer: Uriel Azevedo <urielguima@gmail.com>
pkgname=etymology-cli-git
pkgver=r3.9ce6bec
pkgrel=1
pkgdesc="Webscrapper for quearing etymological meaning of words based on Etymonline"
arch=(x86_64)
url="https://github.com/UrielAzevedo/etymology-cli.git"
license=(MIT)
depends=(python python-beautifulsoup4 python-lxml)
makedepends=(git)
source=("etymology-cli::git+https://github.com/UrielAzevedo/etmology-cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}"

    install -Dm755 "${srcdir}/${pkgname%-git}/scrapping.py" "${pkgdir}/usr/bin/etymology-cli"
    chmod +x "${pkgdir}/usr/bin/etymology-cli"

	install -Dm644 "${srcdir}/${pkgname%-git}/etymology.1" "${pkgdir}/usr/share/man/man1/etymology.1"
}
