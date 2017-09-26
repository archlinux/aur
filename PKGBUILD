# Maintainer: Simon Doppler (dopsi) <$username _at_ $username _dot_ ch>

_pkgname=git-annex-remote-owncloud
pkgname="${_pkgname}-git"
pkgver=r24.8af1437
pkgrel=1
pkgdesc='A git-annex special remote using owncloud'
arch=('any')
url='https://github.com/TobiasTheViking/owncloudannex'
license=('unknown')
depends=('git-annex' 'python2' 'python2-requests' 'python2-ndg-httpsclient')
makedepends=('python2-setuptools')
source=("${_pkgname}::git+https://github.com/dopsi/owncloudannex")
sha512sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_pkgname}"
	python2 setup.py install --root="${pkgdir}"
#	install -m 755 -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: set ts=4 sw=4:
