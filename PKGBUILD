# Maintainer: Virginia Senioria <tmp underscope 91khr at outlook dot com>
pkgname=ithc-dkms-git
_pkgname="${pkgname%%-*}"
pkgver=0.1
pkgrel=1
pkgdesc="Linux driver for Intel Touch Host Controller"
arch=(x86_64)
url="https://github.com/quo/ithc-linux"
license=(unknown)
groups=()
depends=('dkms')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/quo/ithc-linux.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    sed -n '/^PACKAGE_VERSION="\(.*\)"$/s//\1/p' "$srcdir/${_pkgname}-linux/dkms.conf"
}

package() {
    cd "$srcdir/${_pkgname}-linux"

    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    cp -r src Makefile "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
}
