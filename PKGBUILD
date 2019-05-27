# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Owner: Userspace Containerization team at Red Hat user-cont-team@redhat.com

pkgname=release-bot
pkgver=0.7.1
pkgrel=1
pkgdesc="Release to Github and PyPI with an ease."
url="https://github.com/user-cont/release-bot"
license=("GPL3")
depends=('python' 'python-yaml' 'python-requests' 'python-semver' 'twine' 'python-wheel' 'python-pyjwt' 'python-flask')
makedepends=('python-setuptools')
arch=("i686" "x86_64")
source=("git+https://github.com/user-cont/${pkgname}#tag=${pkgver}")

build() {
	cd ${srcdir}/${pkgname}
	python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('SKIP')
