# Maintainer: Mirko Rovere <04mirko@libero.it>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname="extrattor-git"
pkgver=1.4.r30.g8e1a178
pkgrel=4
pkgdesc="A simple bash wrapper to manage one or more archives from the terminal"
arch=("any")
url="https://github.com/Mirko-r/extrattor"
depends=('unarj' 'unace' 'p7zip' 'tar' 'pax' 'gzip' 'unzip' 'xz' 'zenity')
license=("GPL-3.0")
conflicts=("extrattor")
provides=('extrattor')
makedepends=('git')
source=("git+https://github.com/Mirko-r/extrattor.git")
sha512sums=("SKIP")

_name='extrattor'

pkgver() {
	cd "$_name"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package(){
    echo -e "\nInstalling packages\n"
    install -Dm0755 "${srcdir}/extrattor/extrattor/extrattor.sh" "${pkgdir}/usr/bin/extrattor"
    install -Dm0755 "${srcdir}/extrattor/extrattor/spinner" "${pkgdir}/usr/bin/spinner"
    echo -e "\nInstalling man page\n"
    sudo install -g 0 -o 0 -m 0644 "${srcdir}/extrattor/extrattor/extrattor" "/usr/share/man/"
}
