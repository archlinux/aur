# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Nick Cottrell <ncottrellweb@gmail.com>
pkgname=rz-jsdec # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.8.0
pkgrel=1
pkgdesc="Provides js decompiler for rizin"
arch=('any')
url="https://github.com/rizinorg/jsdec.git"
license=('GPL3')
groups=()
depends=('rizin')
makedepends=('meson' 'ninja') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rizinorg/${pkgname#rz-}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f6c1ad0bdd6ee73433263113dee4f2a0eef7552b3551c50bd75f59dbf26e6b9')

build() {
    cd "$srcdir/${pkgname#rz-}-${pkgver}/"
    meson setup build --prefix=$pkgdir/usr
}

package() {
    cd "$srcdir/${pkgname#rz-}-${pkgver}/"
    ninja -C build install
}
