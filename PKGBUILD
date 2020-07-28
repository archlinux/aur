# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Dmitry <dmitry@ykkz.de>

pkgname=(otf-spectral ttf-spectralsc otf-spectralsc)
pkgbase=spectral-font
pkgver=2.003
pkgrel=3
pkgdesc='Screen-first serif font face'
arch=('any')
url='https://fonts.google.com/specimen/Spectral'
license=('OFL')

_reponame=Spectral
_commit='748733e3761fc7985ca9c473996ed121954debf8'
source=("https://github.com/productiontype/$_reponame/archive/$_commit/$pkgbase-$pkgver.zip")
sha256sums=('67cd3d1719b0650d8adac5115908882cc63f2ce964ff0fddbf6ec574b933b5b2')

_package() {
	cd $srcdir/$_reponame-$_commit
	install -Dm644 fonts/$1/* -t "$pkgdir/usr/share/fonts/$pkgname/"
	install -Dm644 ofl.txt    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# package_ttf-spectral() {
# 	conflicts=(otf-spectral)
# 	_package desktop
# }

package_otf-spectral() {
	conflicts=(ttf-spectral)
	_package desktop_otf
}

package_ttf-spectralsc() {
	conflicts=(otf-spectralsc)
	pkgdesc+=' (small caps)'
	_package sc
}

package_otf-spectralsc() {
	conflicts=(ttf-spectralsc)
	pkgdesc+=' (small caps)'
	_package sc_otf
}
