# Maintainer: apetresc <apetresc at gmail dot com>
# Contributor: realitygaps <realitygaps at yahoo dot com>

pkgbase=s4cmd
pkgname=s4cmd-python3-git
pkgver=132.80059bf
pkgrel=1
pkgdesc="Super S3 command line tool (git) for Python 3"
arch=('any')
url="https://github.com/bloomreach/${pkgbase}"
license=('GPL')
depends=('python' 'python-dateutil' 'python-boto3')
makedepends=(git python-setuptools)
optdepends=('gnupg: encrypted file storage')
provides=('s4cmd')
conflicts=('s4cmd')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${pkgbase}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
  cd "${srcdir}/${pkgbase}"
  python setup.py install --root="$pkgdir"
}
