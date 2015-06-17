# Maintainer: David Vogt <david.vogt@adfinis-sygroup.ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages


pkgbase=apstools
pkgname=('apstools')
pkgdesc='Parallels APS Command Line Tools'
pkgver=2.1
subversion=43
pkgrel=1
arch=('i686' 'x86_64')
url='http://doc.apsstandard.org/tools/cli_tools/'
license=('custom')
replaces=('apstools' 'apslint')
conflicts=('apstools' 'apslint')
provides=('apstools')
depends=('java-runtime')
optdepends=()
makedepends=(rpmextract)

source=("http://download.apsstandard.org/apstools/2.1-43/apstools-${pkgver}-${subversion}.noarch.rpm")
md5sums=(4e395ad4167941e865b8e0827f07062b)

prepare() {
    rpmextract.sh apstools-${pkgver}-${subversion}.noarch.rpm
}

package() {

    install -dm755 "$pkgdir"/usr
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/lib
    install -dm755 "$pkgdir"/usr/lib/aps
    install -dm755 "$pkgdir"/usr/lib/aps/lib

    install -m 0755 usr/lib/aps/lib/*   "$pkgdir"/usr/lib/aps/lib/
    install -m 0755 usr/bin/*           "$pkgdir"/usr/bin
}

# vim:set ts=4 sw=4 et:
