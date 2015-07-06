# Maintainer: realitygaps <realitygaps at yahoo dot com>

pkgbase=s4cmd
pkgname=${pkgbase}-git
pkgver=36.a9f6deb
pkgrel=1
pkgdesc="Super S3 command line tool (git)"
arch=('any')
url="https://github.com/bloomreach/${pkgbase}"
license=('GPL')
depends=('python2' 'python2-dateutil' 'python2-boto')
makedepends=(git python2-setuptools)
optdepends=('gnupg: encrypted file storage')
provides=('s4cmd')
conflicts=('s4cmd')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${pkgbase}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
  cd "${srcdir}/${pkgbase}"
  python2 setup.py install --root="$pkgdir"
}
