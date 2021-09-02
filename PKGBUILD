# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.1.0
pkgrel=2579
pkgdesc='SecureCRT + SecureFX 9.0 Bundle'
arch=('x86_64')
url='https://www.vandyke.com/'
license=('custom:VanDyke')
depends=('glibc' 'openssl' 'qt5-base' 'icu66')
provides=('SecureCRT' 'SecureFX')
install=${pkgname}-${pkgver}-${pkgrel}.install

_bundle_name=scrt-sfx
_tarball_base_name=${_bundle_name}-${pkgver}.${pkgrel}.ubuntu20-64
_tarball_name=${_tarball_base_name}.tar.gz

source=(
	"file://${_tarball_name}"
	"${install}"
)

sha512sums=(
	"ac609dd12fade735ca6548cd5073feae585469b2a93d78861239640928100b98820529390184dfe78cfe4219280f5f4c0dd31553b574c20b7584bb74ea0fb580"
	"99ce90035de7b91677a93b36f578c33616f71b605a90c659742f7ff0a03b0fd4406c46a9e62658bb605e62a502eec844dd2e23a88e5942d9001353149920c2cc"
)

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	cp -R "${srcdir}"/${_bundle_name}-${pkgver}/* "${stage_dir}"

	ln -s /usr/lib/qt/plugins/platforms "${pkgdir}/opt/${pkgname}/${_tarball_base_name}"
}
