# Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>
pkgname=jade-application-kit-git
pkgver=2018.04.18
pkgrel=1
pkgdesc="Build desktop applications using web technologies on Linux, with Python, JavaScript, HTML5, and CSS3 and webkit."
arch=('any')
url="https://pypi.org/project/Jade-Application-Kit/"
license=('GPL3')
provides=('jade-application-kit')
conflicts=('jade-application-kit')
depends=('python' 'python-gobject' 'webkit2gtk')
makedepends=('python-setuptools' 'git')
source=('git+https://github.com/codesardine/Jade-Application-Kit.git')
sha512sums=('SKIP')

pkgver() {
	cd Jade-Application-Kit
	grep "version" setup.py | cut -d '"' -f2
}

build() {
    cd Jade-Application-Kit
    python setup.py build
}

package() {
    depends+=()
    cd Jade-Application-Kit
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
