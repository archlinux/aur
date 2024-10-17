# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Dmitry <dmitry@ykkz.de>

pkgname=(ttf-spectral otf-spectral ttf-spectralsc otf-spectralsc)
pkgbase=spectral-font
pkgver=2.005
pkgrel=1
pkgdesc='Screen-first serif font face'
arch=('any')
url='https://fonts.google.com/specimen/Spectral'
license=('OFL-1.1-no-RFN')
options=('!debug')

_reponame=Spectral
_commit='f89366613f7deb4f2f92cd6e0e905311aab6a3cc'
source=("https://github.com/productiontype/$_reponame/archive/$_commit/$pkgbase-$pkgver.zip")
sha256sums=('3bdf318d6653daf821ddb957c2d637b4971b17c3b82946472efdad6b805d8b01')

_package() {
	cd $srcdir/$_reponame-$_commit
	install -Dm644 fonts/$1/Spectral* -t "$pkgdir/usr/share/fonts/$pkgname/"
	install -Dm644 ofl.txt    -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-spectral() {
	conflicts=(otf-spectral)
	_package ttf
}

package_otf-spectral() {
	conflicts=(ttf-spectral)
	_package otf
}

package_ttf-spectralsc() {
	conflicts=(otf-spectralsc)
	pkgdesc+=' (small caps)'
	_package ttf/SC
}

package_otf-spectralsc() {
	conflicts=(ttf-spectralsc)
	pkgdesc+=' (small caps)'
	_package otf/SC
}
