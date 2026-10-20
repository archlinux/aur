# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-tree plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-tree-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='ElyTree, part of Ely Office - Git client (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('curl' 'expat' 'glibc' 'libgcc' 'libxcb' 'openssl' 'vulkan-icd-loader' 'wayland' 'zlib')
provides=('ely-tree')
conflicts=('ely-tree')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-tree-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-tree-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('b17666cfcd8eb22b5f50374d3b30a73b0eb4562d78e32e7fba7db3f65b542d27')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
