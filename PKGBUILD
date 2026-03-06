# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=gram-editor-bin
pkgver=1.0.0
pkgrel=7
pkgdesc="A code editor for humanoid apes and grumpy toads"

provides=(gram-editor gram)
conflicts=(gram-editor gram)

arch=('x86_64')

url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)

depends=(alsa-lib
	fontconfig
	glibc
	libstdc++
    libxcb
    libxkbcommon
    libxkbcommon-x11
	openssl
	sqlite
    vulkan-driver
    vulkan-icd-loader
    vulkan-tools
    wayland
	zlib
	zstd
)

optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/gram-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('12b945739396312d9af27b1866d5b05ac6caf78415027798f5a68c1282bec331')

package() {
	cd "gram.app"
	
	install -Dm0755 bin/gram "$pkgdir/usr/bin/gram"
	install -Dm0755 libexec/gram-editor "$pkgdir/usr/lib/gram/gram-editor"
	install -Dm0644 share/applications/gram.desktop "$pkgdir/usr/share/applications/se.ziran.Gram.desktop"
	install -Dm0644 share/icons/hicolor/512x512/apps/gram.png "$pkgdir/usr/share/icons/gram.png"
}

