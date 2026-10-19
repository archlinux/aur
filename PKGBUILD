# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-show plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-show-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='ElyShow, part of Ely Office - presentation editor (prebuilt upstream package)'
arch=('x86_64')
url='https://git.zacharyzhang.com/ZacharyZhang-NY/ElyOffice'
license=('AGPL-3.0-or-later')
depends=('glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-show')
conflicts=('ely-show')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/tag/v$pkgver/LICENSE")
sha256sums=('57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
source_x86_64=("ely-show-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-show-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('8c8806d5c493f120a301eaad95f4a1150a5c80edb82b78ffe928fb7bf166ba5c')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
