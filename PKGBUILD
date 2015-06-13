# Maintainer: Tom < reztho at archlinux dot us >
pkgname=mate-tweak-git 
pkgver=3.4.7.r0.2d912fa
pkgrel=1
pkgdesc="Mate desktop configuration tool"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('python2' 'wmctrl')
makedepends=('git' 'python2-setuptools' 'python2-distutils-extra') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mate-tweak::git+https://bitbucket.org/ubuntu-mate/mate-tweak.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}
