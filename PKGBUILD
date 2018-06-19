# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=s3cmd
pkgname=${gitname}-git
pkgver=1705.c0d66ac
pkgrel=1
pkgdesc="A command line client for Amazon S3 (git)"
arch=('any')
url="https://github.com/s3tools/${gitname}"
license=('GPL')
depends=(python2 python2-dateutil python-magic)
makedepends=(git python2-setuptools)
optdepends=('gnupg: encrypted file storage')
provides=('s3cmd')
conflicts=('s3cmd')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
  cd "${srcdir}/${gitname}"
  python2 setup.py install --root="$pkgdir"
}
