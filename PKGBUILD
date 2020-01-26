# Maintainer: TransistorLogic <liuhongwu2003@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

pkgname=python-cyaron
_name=cyaron
pkgver=0.4.2
pkgrel=1
pkgdesc="CYaRon: Yet Another Random Olympic-iNformatics test data generator, A library for automatically generating test data for Online Judge, Olympic Informatics or automatic application testing. The copyright belongs to Luogu"
url="https://www.luogu.org/"
depends=('python' 'python-colorful' 'python-xeger')
makedepends=('python-setuptools' )
license=('LGPLv3')
arch=('any')
#source=("https://files.pythonhosted.org/packages/b1/e9/279c7ab30b2ae766241487ea9bc86101a00b26b443d33ac9db1e58e090e9/cyaron-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('b04af533e39ffb0232dc6fa9fb2a3250')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

#	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

#build() {
#    cd $srcdir/cyaron-${pkgver}
#    python setup.py build
#}
#
#package() {
#    cd $srcdir/cyaron-${pkgver}
#    python setup.py install --root="$pkgdir" --optimize=1 
#}
