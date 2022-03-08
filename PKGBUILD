# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=oidc_login
pkgname=nextcloud-app-${_appname/_/-}
pkgver=2.3.1
pkgrel=1
pkgdesc='App for authenticating Nextcloud users using SAML'
arch=(x86_64)
url="https://github.com/pulsejet/${pkgname//-app}"
license=(AGPL3)
depends=(nextcloud)
makedepends=(rsync)
source=("$_appname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_appname.tar.gz")
sha256sums=('387a424629dcf79fdf645dd9371bb403ba87297f3ea6afb6b7f355857fd0f82b')

package() {
	cd "$_appname"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}
