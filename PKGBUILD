# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: StephenB <mail4stb at gmail dot com>
# Contributor: M Rawash <mrawash@gmail.com>

pkgname=urxvt-tabbedex-git
pkgver=0.4.r36.g3b82917
pkgrel=1
pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
arch=("any")
url='https://github.com/mina86/urxvt-tabbedex'
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=('urxvt-tabbedex')
conflicts=('urxvt-tabbedex')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd urxvt-tabbedex
	git describe --tags --long | sed 's/^tabbedex-//; s/-/-r/; s/-/./g'
}

package() {
	install -Dm644 urxvt-tabbedex/tabbedex "$pkgdir"/usr/lib/urxvt/perl/tabbedex
}
