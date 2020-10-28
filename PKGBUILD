# Maintainer: Tamvana Makuluni <sw@makuluni.com>
pkgname=uki-script
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple bash script and pacman hook to create unified kernel images."
arch=('any')
url="https://www.github.com/emakman/unified-kernel-image-script"
license=('CC0')
groups=()
depends=('bash' 'coreutils' 'binutils' 'sbsigntools' 'sed')
optdependes=('systemd: for default EFI stub and splash image')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('uki-script::git+http://www.github.com/emakman/unified-kernel-image-script')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/uki-script"
    awk -e'/# v/ {print substr($2,2)}' uki-script
}

package() {
	cd "$srcdir/uki-script"
	DESTDIR="$pkgdir/" ./install
}
