# Maintainer: Gunther Cox <gunthercx at gmail dot com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=('python-chatterbot' 'python2-chatterbot')
pkgver=0.5.5
pkgrel=1
pkgdesc="ChatterBot is a machine learning, conversational dialog engine."
arch=("any")
url="https://github.com/gunthercox/ChatterBot"
license=('BSD')
source=("https://github.com/gunthercox/ChatterBot/archive/$pkgver.tar.gz")
makedepends=("python-requests"
	     "python-pymongo" 
	     "python-requests" 
	     "python2-setuptools" 
	     "python2-pymongo" 
	     "python2-requests")
build() {
	cd "ChatterBot-$pkgver"
	python2 setup.py build
}

package_python-chatterbot() {
	depends=("python" 
		 "python-nltk" 
		 "python-twitter"
		 "python-numpy"
		 "python-jsondatabase")
	cd "ChatterBot-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-chatterbot() {
	makedepends=()
	depends=("python2" 
		 "python2-nltk" 
		 "python2-twitter"
		 "python2-numpy"
		 "python2-jsondatabase")
	cd "ChatterBot-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}


md5sums=('4eac3382c6c351da899916d9d5cbfa5a')
