# Maintainer: Aloxaf <aloxafx at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Lalit Maganti <laitmaganti@gmail.com>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=s3ql
pkgver=5.1.1
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('x86_64')
url="https://github.com/s3ql/s3ql"
license=('GPL3')
depends=(
	'python-cryptography'
	'python-defusedxml'
	'python-apsw'
	'python-trio'
	'python-pyfuse3'
)
optdepends=(
	'python-systemd: for enabling systemd support'
	'python-requests: for OAuth2 authentication with Google Storage'
	'python-google-auth: for ADC authentication with Google Storage'
	'python-google-auth-oauthlib: for browser-based authentication with Google Storage'
)
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
install=s3ql.install
changelog=ChangeLog.rst
source=("https://github.com/s3ql/s3ql/releases/download/s3ql-${pkgver}/s3ql-${pkgver}.tar.gz")
sha256sums=('4bbab3e459412e4f9c56340a5c004f46e0c65edb11a19646c64475babee8e2e3')

prepare() {
	cd "$srcdir/s3ql-${pkgver}"
}

build() {
	cd "$srcdir/s3ql-${pkgver}"
	python setup.py build_ext --inplace
}

package() {
	cd "$srcdir/s3ql-${pkgver}"
	python setup.py install --root="$pkgdir"
}
