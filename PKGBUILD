# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=s3cmd-git
pkgver=2.1.0.75.5834228
pkgrel=1
pkgdesc="A command line client for Amazon S3 (development version)"
arch=('any')
url="https://github.com/s3tools/${pkgname%-git}"
license=('GPL')
depends=('python' 'python-dateutil')
makedepends=('git' 'python-setuptools')
optdepends=('gnupg: encrypted file storage'
            'python-magic: determine mimetype based on contents')
provides=('s3cmd')
conflicts=('s3cmd')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/-/./g;s/[grv]//g')"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	python setup.py install --root="$pkgdir"
}
