# Maintainer: Pierre PAILLEUX <pailleux.pierre@gmail.com>
pkgname=bhash_crack-git
pkgrel=1
pkgver=1.6
pkgdesc='Hash cracking tool written in Bash'
arch=('any')
license=('SYPLicense')
makedepends=('git')
provides=('bhash_crack')
conflicts=('bhash_crack')
source=("${pkgname}::git+https://github.com/pPailleux/bhash_crack.git")
sha512sums=('SKIP')

build() {
    cd "${pkgname}"
    sudo mkdir /opt/${pkgname}
    sudo chown -R ${USER}:users /opt/${pkgname}
}

package() {
    cd "${pkgname}"
    cp bhash_crack.sh /opt/$pkgname
    sudo ln -s /opt/bhash_crack-git/bhash_crack.sh /usr/bin/bhash
}
