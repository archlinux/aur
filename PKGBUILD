# Maintainer: Redeven <18680184+redeven@users.noreply.github.com>
pkgname=hudkit
pkgver=4.1.0
pkgrel=1
epoch=0
pkgdesc="Transparent click-through web browser overlay, using WebKit"
arch=('x86_64')
url="https://github.com/anko/hudkit"
license=('ISC')
depends=('gtk3' 'webkit2gtk')
makedepends=('make' 'pkgconf' 'gcc')
source=("hudkit::git+https://github.com/anko/hudkit.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/hudkit"
	echo -e 'install:\n\tinstall -D -m 755 hudkit $(DESTDIR)/usr/bin/hudkit' >> makefile
}

build() {
    cd "${srcdir}/hudkit"
	make
}

package() {
	cd "${srcdir}/hudkit"
	make DESTDIR="$pkgdir" install
}
