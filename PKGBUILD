# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=python-pam
_user=FirefighterBlu3
pkgname=${_projname}-git
provides=${_projname}
pkgver=r31.583cfe7
pkgrel=1
pkgdesc='Python pam module supporting py3 (and py2)'
arch=('any')
url="https://github.com/${_user}/${_projname}"
license=('MIT')
depends=('python')
source=("git+https://github.com/${_user}/${_projname}")
sha256sums=('SKIP')

pkgver() {
	cd ${_projname}
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_projname}
    python setup.py install --root="$pkgdir"
    install -d "$pkgdir/usr/share/licenses/python-pam-git"
    install -D LICENSE "$pkgdir/usr/share/licenses/python-pam-git"
}

