pkgname="ddev-edge-bin"
pkgver=v1.19.0_rc1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.19.0-rc1/ddev_linux-amd64.v1.19.0-rc1.tar.gz")
sha256sums=("7e4012e08172b441d53727537295a8efe6c64f3b61447c8779249d7dde9b57b6")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0644 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
	install -D -m 0644 ddev_zsh_completion.sh "$pkgdir/usr/share/zsh/site-functions/_ddev"
	install -D -m 0644 ddev_fish_completion.sh "$pkgdir/usr/share/fish/vendor_completions.d/ddev.fish"
}
