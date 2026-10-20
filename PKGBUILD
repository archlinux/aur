# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-mark plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-mark-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='ElyMark, part of Ely Office - Markdown editor with Git support (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('curl' 'expat' 'glibc' 'libgcc' 'libstdc++' 'libxcb' 'openssl' 'vulkan-icd-loader' 'wayland' 'zlib')
provides=('ely-mark')
conflicts=('ely-mark')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-mark-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-mark-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('f92381f6f3cb7eac7476937ce3f8f861a2d3a5cdd3eeb46bc0aecd0b78a25a14')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
