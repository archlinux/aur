# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Owner: Userspace Containerization team at Red Hat user-cont-team@redhat.com

_pkgname=release-bot
pkgname=release-bot-git
pkgver=0.7.1
pkgrel=1
pkgdesc="Release to Github and PyPI with an ease."
url="https://github.com/user-cont/release-bot"
license=("GPL3")
depends=('python' 'python-yaml' 'python-requests' 'python-semver' 'twine' 'python-wheel' 'python-pyjwt' 'python-flask' 'python-gitchangelog' 'python-pystache' )
makedepends=('python-setuptools')
arch=("x86_64")
source=("git+https://github.com/user-cont/${_pkgname}#branch=master")

build() {
	cd ${srcdir}/${_pkgname}
	python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

md5sums=('SKIP')
