# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=gram-editor-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="A code editor for humanoid apes and grumpy toads"

provides=(gram-editor gram)
conflicts=(gram-editor gram)

arch=('x86_64')

url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)

depends=('alsa-lib'
		'fontconfig'
		'gcc-libs'
		'glibc'
		'libxcb'
		'libxkbcommon'
		'libxkbcommon-x11'
		'openssl'
		'sqlite'
		'vulkan-driver'
		'vulkan-icd-loader'
		'vulkan-tools'
		'wayland'
		'zlib')

optdepends=(
	'rustup: enables installing extensions'
	'clang: improved C/C++ language support'
	'eslint: improved Javascript language support'
	'pyright: improved Python language support'
	'rust-analyzer: improved Rust language support'
)

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/gram-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('28d1623a32c8d99fe494754eb1aa7b34d66904e79bc19a7fa2ec772c3abaf45f')

package() {
	cd "gram.app"
	
	install -Dm0755 bin/gram "$pkgdir/usr/bin/gram"
	install -Dm0755 libexec/gram-editor "$pkgdir/usr/lib/gram/gram-editor"
	install -Dm0644 share/applications/gram.desktop "$pkgdir/usr/share/applications/app.liten.Gram.desktop"
	install -Dm0644 share/icons/hicolor/scalable/apps/app.liten.Gram.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/app.liten.Gram.svg"
	install -Dm0644 share/icons/hicolor/symbolic/apps/app.liten.Gram-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/app.liten.Gram-symbolic.svg"
}

