# Maintainer: xihale <i@xihale.top>
# Upstream publishes ready Arch packages (nfpm): /opt/ely-office/ely-show plus
# /usr/bin symlink, desktop entry and icon. Repack them verbatim.
pkgname=ely-show-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='ElyShow, part of Ely Office - presentation editor (prebuilt upstream package)'
arch=('x86_64')
url='https://github.com/ELY-Open-Source/ElyOffice'
license=('MIT')
depends=('glibc' 'krb5' 'libgcc' 'libstdc++' 'libxcb' 'vulkan-icd-loader' 'wayland')
provides=('ely-show')
conflicts=('ely-show')
options=('!strip' '!debug')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('6f90eb4b2f3d6354ac31cdf330a711d9e43d8c95b968dc046f49443db956b2c1')
source_x86_64=("ely-show-$pkgver-1-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/ely-show-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('12c5d8bf178b277e0faa72ba8ec23711ec47b763401b8fa59c29608fd606ca8f')

package() {
	cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
