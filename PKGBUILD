pkgname=taskline
pkgver=1.0
pkgrel=1
pkgdesc="Simple command-line task manager in C"
arch=('x86_64')
url="https://github.com/matheusdev-45/taskline/"
license=('mit')
depends=('glibc')
source=("taskline-1.0.tar.gz::https://github.com/matheusdev-45/taskline/archive/refs/tags/v1.0.tar.gz")
sha256sums=('96d12eaf5f84daa03b63fc3f31233b5f21298fe5bd297afdce83058f5987b2d6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 taskline "${pkgdir}/usr/bin/taskline"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
