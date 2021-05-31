# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=oidc_login
pkgname=nextcloud-app-${_appname/_/-}
pkgver=2.0.4
pkgrel=1
pkgdesc='App for authenticating Nextcloud users using SAML'
arch=(x86_64)
url="https://github.com/pulsejet/${pkgname//-app}"
license=(AGPL3)
depends=(nextcloud)
makedepends=(rsync)
source=("$_appname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_appname.tar.gz")
sha256sums=('164a4e76a4507de4253c4b9433b87cac8928f53ea368741b02adee6c41aa84db')

package() {
    cd "$_appname"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}
