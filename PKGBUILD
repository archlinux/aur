pkgname="ddev-edge-bin"
pkgver=v1.19.0_alpha5
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.19.0-alpha5/ddev_linux-amd64.v1.19.0-alpha5.tar.gz")
sha256sums=("84d69243710d431523b1ef376932427cb8b1fcd238e66ce519d60948c3ec92ef")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0644 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
	install -D -m 0644 ddev_zsh_completion.sh "$pkgdir/usr/share/zsh/site-functions/_ddev"
	install -D -m 0644 ddev_fish_completion.sh "$pkgdir/usr/share/fish/vendor_completions.d/ddev.fish"
}
