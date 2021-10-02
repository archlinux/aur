# Maintainer: Groctel <aur@taxorubio.com>

_name=isosurfaces

pkgname=python-isosurfaces
pkgver=0.1.0
pkgrel=1
pkgdesc="Construct isolines/isosurfaces of a 2D/3D scalar field defined by a function."

arch=('any')
# license=('MIT') Missing in v0.1.0
url="https://github.com/jared-hughes/isosurfaces"

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0331d626dae0f1fd71ce9d9a559aa27d223ebf58c04564dd98b747cb81e6ee259696495c6deb7c6b47cd812647b505c3101486ee704bd9b69656396a6aac23a5')

depends=(
	'python'
	'python-numpy'
)
makedepends=('python-setuptools')

build ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	# install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
