# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: StephenB <mail4stb at gmail dot com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=urxvt-tabbedex-git
pkgver=0.4.r9.g49c1514
pkgrel=2
pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
arch=("any")
url='http://github.com/stepb/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')
install=urxvt-tabbedex-git.install
source=('git+https://github.com/stepb/urxvt-tabbedex.git'
		'0001-make-urxvt-tabbedex-work-with-perl-5.18.patch'
		'urxvt-tabbedex-git.install')
md5sums=('SKIP'
         '92d581a40779da3127c88fdc7d10257f'
         'a07c8a1c46379ab763a113d3d9f4111e')

pkgver() {
	cd urxvt-tabbedex
	git describe --tags --long | sed 's/^tabbedex-//; s/-/-r/; s/-/./g'
}

prepare() {
	cd urxvt-tabbedex
	git apply ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
	install -Dm644 urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}

# vim: set ts=4 sw=4 noet:
