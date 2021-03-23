# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=django-pyscss
pkgname=python-$_pyname
pkgver=2.0.2
pkgrel=1
pkgdesc="Makes it easier to use PySCSS in Django."
arch=(any)
url="https://github.com/fusionbox/django-pyscss"
license=(BSD)
depends=(
	python
	python-pyscss
	python-django
	python-django-utils-six
)
makedepends=(python-setuptools)
checkdepends=(
	python-pillow
	python-django-compressor
	python-django-discover-runner
	python-mock
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('f8dbcc4d314c8e220aa311ec6561b06d')
sha256sums=('0f4844f8fd3f69f4d428a616fdcf2b650a24862dd81443ae3fba14980c7b0615')
sha512sums=('dfce4fb97581a9452b68a99dedf43f8a8fa9a874593c5fda9f2a4707cbd76d50c05eecd68a9a7481316ae41a42ca7b37a99c3584b70badb3260a3aa511413330')

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
