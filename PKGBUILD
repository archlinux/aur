pkgname="ddev-edge-bin"
pkgver=v1.18.3_alpha1
pkgrel=1
pkgdesc='DDEV-Local: a local PHP development environment system  (edge channel)'
arch=('x86_64')
url='https://github.com/drud/ddev'
license=('Apache')
provides=("ddev")
conflicts=("ddev")
depends=('docker' 'docker-compose')
optdepends=('bash-completion: subcommand completion support')
source=("https://github.com/drud/ddev/releases/download/v1.18.3-alpha1/ddev_linux-amd64.v1.18.3-alpha1.tar.gz")
sha256sums=("8c0cdbee4629d83ec06bdab526f117a9c4ab690abe18688a93e3b5efdf87f810")

package() {
	install -D -m 0755 ddev "$pkgdir/usr/bin/ddev"
	install -D -m 0644 ddev_bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/ddev"
	install -D -m 0644 ddev_zsh_completion.sh "$pkgdir/usr/share/zsh/site-functions/_ddev"
	install -D -m 0644 ddev_fish_completion.sh "$pkgdir/usr/share/fish/vendor_completions.d/ddev.fish"
}
