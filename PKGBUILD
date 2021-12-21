# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=oidc_login
pkgname=nextcloud-app-${_appname/_/-}
pkgver=2.2.0
pkgrel=1
pkgdesc='App for authenticating Nextcloud users using SAML'
arch=(x86_64)
url="https://github.com/pulsejet/${pkgname//-app}"
license=(AGPL3)
depends=(nextcloud)
makedepends=(rsync)
source=("$_appname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_appname.tar.gz")
sha256sums=('00bbc927a33c439bad74c69ec36c065c5716ef23c6389fc64d1b8e76cafdfa28')

package() {
	cd "$_appname"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}
