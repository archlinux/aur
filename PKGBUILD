# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-pdf plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-pdf-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='ElyPDF, part of Ely Office - PDF reading and editing with OCR (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-pdf')
conflicts=('ely-pdf')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-pdf-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-pdf-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('25b95334855c6519994181086d5969162cdefbe262889ae468cecdd8002201b4')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
