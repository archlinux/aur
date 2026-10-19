# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-table plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-table-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='ElyTable, part of Ely Office - spreadsheet editor (prebuilt upstream package)'
arch=('x86_64')
url='https://git.zacharyzhang.com/ZacharyZhang-NY/ElyOffice'
license=('AGPL-3.0-or-later')
depends=('glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-table')
conflicts=('ely-table')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/tag/v$pkgver/LICENSE")
sha256sums=('57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
source_x86_64=("ely-table-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-table-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('3b72073cbd32fef6ed9773ad6c5bcc46bef7857b240d635e55d61c56067b2e51')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
