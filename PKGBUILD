# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: StephenB <mail4stb at gmail dot com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=urxvt-tabbedex
pkgver=0.4
pkgrel=3
pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
arch=("any")
url='http://github.com/stepb/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')
install=urxvt-tabbedex.install
source=('git+https://github.com/stepb/urxvt-tabbedex.git#tag=tabbedex-0.4'
		'0001-make-urxvt-tabbedex-work-with-perl-5.18.patch'
		'urxvt-tabbedex.install')
md5sums=('SKIP'
		 '92d581a40779da3127c88fdc7d10257f'
		 '2b72e16f346240c14bbe27ca23051b7a')

prepare() {
	cd urxvt-tabbedex
	git apply ../0001-make-urxvt-tabbedex-work-with-perl-5.18.patch
}

package() {
	install -Dm644 urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}

# vim: set ts=4 sw=4 noet:
