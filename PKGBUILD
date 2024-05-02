# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=falion-bin
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="An open source, programmed in rust, privacy focused tool and crate for interacting with programming resources (like stackoverflow) fast, efficiently and asynchronously/parallel using the CLI or GUI."
arch=('x86_64')
url="https://github.com/Obscurely/falion"
license=('MIT')
provides=('falion-bin')
conflicts=('falion' 'falion-git')
source=("https://github.com/Obscurely/falion/releases/download/v${pkgver}-stable/falion-linux.tar.gz")
sha256sums=("fcb528430fb8d08654193dc11d39643200db3449ec9610d8080ded30cce55cd3")

package() {
	cd "$srcdir/"

	install -Dm755 falion -t "${pkgdir}/usr/bin/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "linux/desktop/falion.desktop"
	for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "linux/desktop/icons/hicolor/$size/apps/falion.png" \
			"$pkgdir/usr/share/icons/hicolor/$size/apps/falion.png"
	done
}
