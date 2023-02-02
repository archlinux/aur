# Maintainer: éclairevoyant
# Contributor: Daniel Mario <github.com/limadm>
# Contributor: Fredrick Brennan <copypaste at kittens dot ph>

pkgname=bdf2psf
pkgver=1.215
pkgrel=1
epoch=1
pkgdesc='Debian utility to convert BDF font files to PSF format'
arch=('any')
url="https://packages.debian.org/unstable/$pkgname"
depends=('perl')
license=('GPL2')
source=("https://deb.debian.org/debian/pool/main/c/console-setup/${pkgname}_${pkgver}_all.deb"
       "0001-print-help-when-no-args-provided.patch")
b2sums=('746743d77d6609f551ef298a5a6c7ee6eb96c4586c85d30fa705b72c28e16580430e9481303c76bc21823583bf2bb154f7c69668b5c5c5edf4815be4b8a72505'
        '332248177ed0f2caf12fe4d2ccc44d973b52ba9c6c47735976e281e5a05cf43ff375e7a68ec7fe07f0d7c7a7c363e0bd68f7b3a723ed1287063443ce456fe071')

prepare() {
	tar -xvf data.tar.xz "./usr/bin/$pkgname"
	patch -Np1 -i 0001-print-help-when-no-args-provided.patch
}

package() {
	tar -xvf data.tar.xz -C "$pkgdir" --exclude './usr/bin'
	install -Dm755 usr/bin/$pkgname -t "$pkgdir/usr/bin/"
}
