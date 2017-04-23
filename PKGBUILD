# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgbase=python-abjad
pkgname=(python-abjad python2-abjad)
pkgver=2.19
pkgrel=1
pkgdesc="Formalized music score control. Package for Python"
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL 3')
optdepends=('graphviz')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e6c24f854cec74752d0dd3383f90535d8401368737640dd1695f4780f803a2a3')

prepare() {
	cp -rup $srcdir/abjad-$pkgver $srcdir/abjad-$pkgver-python2
}

package_python-abjad() {
	depends=('python' 'lilypond')
	pkgdesc+=" 3"

	cd $srcdir/abjad-$pkgver

	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-abjad() {
	depends=('python2' 'lilypond')
	pkgdesc+=" 2"

	cd $srcdir/abjad-$pkgver-python2

	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

