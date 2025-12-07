# Maintainer: Alois <aloisianer@proton.me>
pkgname=tensamin-bin
_pkgname=tensamin
pkgver=0.1.16
pkgrel=1
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64')
url="https://tensamin.net"
license=('custom')
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         libpulse libpulse.so
         nss # libnss3.so
         zlib libz.so
		 libxss)
provides=('tensamin')
conflicts=('tensamin' 'tensamin-git')
source=("https://github.com/Tensamin/Frontend/releases/download/v${pkgver}/tensamin_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	ar x "${_pkgname}_${pkgver}_amd64.deb"
	tar --zstd -xf data.tar.zst -C "${pkgdir}"
}
