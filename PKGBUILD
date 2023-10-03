# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=kicad-storybook-git
pkgver=r3.bce4e2d
pkgrel=1
pkgdesc="A tool to automatically generate images & READMEs for KiCad symbols & footprints "
arch=(i686 x86_64)
url="https://github.com/and3rson/kicad-storybook"
license=('unknown')
depends=()
makedepends=(git) # 'bzr', 'git', 'mercurial' or 'subversion'
depends=(python imagemagick 'kicad>=7.0.0' python-sexpdata)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=("${pkgname%-git}::git+https://github.com/and3rson/kicad-storybook.git#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p $pkgdir/usr/bin
    install -Dm755 main.py $pkgdir/usr/bin/kicad-storybook
}
