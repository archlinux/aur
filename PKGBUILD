# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-tree plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-tree-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='ElyTree, part of Ely Office - Git client (prebuilt upstream package)'
arch=('x86_64')
url='https://git.zacharyzhang.com/ZacharyZhang-NY/ElyOffice'
license=('AGPL-3.0-or-later')
depends=('curl' 'expat' 'glibc' 'libgcc' 'libxcb' 'openssl' 'vulkan-icd-loader' 'wayland' 'zlib')
provides=('ely-tree')
conflicts=('ely-tree')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/tag/v$pkgver/LICENSE")
sha256sums=('57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
source_x86_64=("ely-tree-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-tree-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('ee08ae11e193f3e4e4ad4d2391b18e5642ec42ceded11ccb54c058a75d38b461')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
