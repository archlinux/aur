# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Michael Hauser-Raspe
pkgname=git-standup-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r99.5ae7d15
pkgrel=1
pkgdesc="Recall what you did on the last working day."
arch=('any')
url="https://github.com/kamranahmedse/git-standup"
license=('MIT')
depends=('bash')
makedepends=('git' 'make') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git-standup::git+https://github.com/kamranahmedse/git-standup')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sudo make install
}