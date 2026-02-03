# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Harry Roberts <harryroberts306@gmail.com>
pkgname=nextdots-cli-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r6.0098923
pkgrel=1
pkgdesc="The CLI for my NEXTDOTS"
arch=(any)
url="https://github.com/DESKEDIT/nextGPLdots-cli.git"
license=('unknown')
groups=()
depends=('bash')
makedepends=(base git) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("nextdots-cli")
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/DESKEDIT/nextdots-cli.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/nextdots-cli"
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/nextdots-cli"
	DESTDIR="$pkgdir/usr/bin" ./install
}
