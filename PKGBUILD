# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=issuu-dl
pkgver=0.3
pkgrel=1
pkgdesc="a downloader for issuu.com"
arch=("any")
url="https://github.com/noahvogt/issuu-dl.git"
license=('GPL')
depends=('python-termcolor' 'img2pdf' 'python-tqdm')
provides=('issu-dl')
conflicts=('issu-dl')
source=("$pkgname::git+https://github.com/noahvogt/issuu-dl.git")
md5sums=('SKIP')

package() {
	cd "$pkgname"
    git checkout v0.3
	install -Dm755 issuu-dl ${pkgdir}/usr/bin/issuu-dl

	mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
