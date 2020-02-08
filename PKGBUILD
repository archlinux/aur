# Maintainer: Martin Wimpress <code@flexion.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=bzr-fastimport
pkgver=0.14.0.r361
pkgrel=2
pkgdesc='Bazaar Fast Import is a plugin providing fast loading of revision control data into Bazaar'
arch=('any')
url='https://launchpad.net/bzr-fastimport'
license=('GPL2')
depends=('bzr' 'python2-fastimport')
source=("${pkgname}::bzr+lp:bzr-fastimport#revision=360"
        "str-mark.diff")
sha256sums=('SKIP'
            'd7e2f7c088570d9f9482bf4bba97885cf262260737b87c0ebb1122234331aeb6')

prepare() {
    cd ${pkgname}

    patch -p1 < ../str-mark.diff
}

package() {
    cd ${pkgname}

    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
