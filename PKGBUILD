# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-table plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-table-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='ElyTable, part of Ely Office - spreadsheet editor (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-table')
conflicts=('ely-table')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-table-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-table-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('c88ae213d9f3241553ed3c0f2fab4bbb5299d6ccaf616aecdd0803d39944bd25')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
