# Maintainer: Kevin Kaland < kevin at wizone dot solutions >

_name="ddev"
_version="1.14.0"
_versionsuffix="rc2"
_downloadver="$_version"-"$_versionsuffix"
pkgname="$_name-edge-bin"
pkgver="$_version"_"$_versionsuffix"
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system (edge release)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("$_name")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v$_downloadver/ddev_linux.v$_downloadver.tar.gz")
sha256sums=("14038228baaa025cc58376d3ba1638154ac67ba830eeefaf49121ad5ea9a42ef")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0755 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
}
