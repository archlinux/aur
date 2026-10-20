# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-doc plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-doc-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='ElyDoc, part of Ely Office - offline-first word processor (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-doc')
conflicts=('ely-doc')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-doc-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-doc-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('7f4648df9fa1ea820edbfd01da00a4901b76355b38c130f38ad87f342a8cb1ac')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
