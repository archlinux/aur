# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=python-hosts
_pypiname=${pkgname}
pkgver=0.4.7
pkgrel=2
pkgdesc='a hosts file manager library written in python'
arch=('any')
url='https://github.com/jonhadfield/python-hosts'
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('08efb4ddf7cfd8b7c2b14544b0b851f9')
sha256sums=('007d031efc3e9211c4f4360734df5f9b173a08003ceea430bec64a85248cb749')

prepare() {
	cd "${_pypiname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pypiname}-${pkgver}"

	python setup.py install \
		--optimize=1 \
		--prefix=/usr \
		--root=${pkgdir} \
		--skip-build

	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
