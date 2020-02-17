# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: StephenB <mail4stb at gmail dot com>
# Contributor: M Rawash <mrawash@gmail.com>

gitname=urxvt-tabbedex
pkgname=${gitname}-mina86-git
pkgver=v19.21.r10.ga65e1cc
pkgrel=1
pkgdesc="A tabbed extension for rxvt-unicode with several enhancements"
arch=("any")
url="https://github.com/mina86/${gitname}"
license=("GPL")
depends=('rxvt-unicode')
makedepends=('git')
provides=("${gitname}"{,-git})
conflicts=("${gitname}"{,-git})
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${gitname}"
	git describe --tags --long | sed 's/^tabbedex-//; s/-/-r/; s/-/./g'
}

package() {
	install -Dm644 "${gitname}/tabbedex" "${pkgdir}/usr/lib/urxvt/perl/tabbedex"
}
