# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Guidelines specific to Bazaar, Git, Mercurial and Subversion packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Harry Roberts <harryroberts306@gmail.com>
pkgname=nextdots-cli-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r11.6516cf7
pkgrel=1
pkgdesc="The CLI for my NEXTDOTS"
arch=(any)
url="https://gitlab.com/harryr307/nextdots-cli.git"
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
source=('git+https://gitlab.com/harryr307/nextdots-cli.git')
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
