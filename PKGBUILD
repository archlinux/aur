# Maintainer: Johannes Löthberg <demizide@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=urxvt-tabbedex-git
pkgver=0.4.r9.g49c1514
pkgrel=1
pkgdesc="Tabbed plugin for rxvt-unicode with many enhancements, git version with perl 5.18 patch."
arch=("any")
url='http://github.com/stepb/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')
install=urxvt-tabbedex-git.install
source=('git://github.com/stepb/urxvt-tabbedex.git'
		'0001-make-urxvt-tabbedex-work-with-perl-5.18.patch')
md5sums=('SKIP'
		 '92d581a40779da3127c88fdc7d10257f')

pkgver() {
	cd urxvt-tabbedex
	printf "%s" "$(git describe --tags --long | sed 's/^tabbedex-//;s/-/-r/' | tr - .)"
}

prepare() {
	cd urxvt-tabbedex
	git apply ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
	install -Dm644 "$srcdir"/urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}

# vim: set ts=4 sw=4 noet:
