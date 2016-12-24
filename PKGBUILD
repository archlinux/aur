pkgname=python2-pysolar
pkgver=0.6
pkgrel=3
pkgdesc="Collection of Python libraries for simulating the irradiation of any point on earth by the sun. It includes code for extremely precise ephemeris calculations."
arch=('x86_64')
depends=('python2'
		 'python2-numpy'
         'python2-setuptools'
		 'python2-pytz'
		)
url='http://pysolar.org/'
license=('GPLv3')
md5sums=('78005c1e498100cc30842af20ca76069'
         '5b0209ad50cab6b281daf44f5102688e')
source=('https://github.com/pingswept/pysolar/archive/0.6.tar.gz'
		'radiation.patch')


prepare() {
	patch -Np0 -i radiation.patch 
}
package() {
	cd "${srcdir}/pysolar-0.6/"
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
