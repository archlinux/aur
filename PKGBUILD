# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=oidc_login
pkgname=nextcloud-app-${_appname/_/-}
pkgver=2.3.2
pkgrel=1
pkgdesc='App for authenticating Nextcloud users using SAML'
arch=(x86_64)
url="https://github.com/pulsejet/${pkgname//-app}"
license=(AGPL3)
depends=(nextcloud)
makedepends=(rsync)
source=("$_appname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_appname.tar.gz")
sha256sums=('07b1cb6571f42474bc42f62c76c12a9eba901a6abddaef66c14c11c4d4b3854d')

package() {
	cd "$_appname"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}
