# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=oidc_login
pkgname=nextcloud-app-${_appname/_/-}
pkgver=2.0.2
pkgrel=1
pkgdesc="App for authenticating Nextcloud users using SAML"
arch=(x86_64)
url="https://github.com/pulsejet/${pkgname//-app}"
license=(AGPL3)
depends=(nextcloud)
source=("$_appname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_appname.tar.gz")
sha256sums=('7a13e22f532911a6bb2d9d5d11411cab9bed553a24f10d9a643cfd704bf60e63')

package() {
    cd "$_appname"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}
