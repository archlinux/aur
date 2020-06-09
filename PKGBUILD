# Maintainer: Kevin Kaland < kevin at wizone dot solutions >

_name="ddev"
_version="1.15"
_versionsuffix="alpha3"
_downloadver=$_version
pkgname="$_name-edge-bin"
pkgver="$_version"_"$_versionsuffix"
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("$_name")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v$_downloadver-$_versionsuffix/ddev_linux.v$_downloadver-$_versionsuffix.tar.gz")
sha256sums=("944b7bdfcdf6c4836a0b92b923d082b6dfdf5602f86007b5b59759608bcd2e29")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
