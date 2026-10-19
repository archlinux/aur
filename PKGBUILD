# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-pdf plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-pdf-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='ElyPDF, part of Ely Office - PDF reading and editing with OCR (prebuilt upstream package)'
arch=('x86_64')
url='https://git.zacharyzhang.com/ZacharyZhang-NY/ElyOffice'
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-pdf')
conflicts=('ely-pdf')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/tag/v$pkgver/LICENSE")
sha256sums=('57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
source_x86_64=("ely-pdf-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-pdf-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('adb66ec5a3c71dc55963364e191bce42ee80990963e40623edd0177cdecb2dd9')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
