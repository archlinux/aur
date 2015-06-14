# Maintainer: Ramon Snir <r@mon.co.il>
pkgname=detoul
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="a declarative tool for creating integration branches in git"
arch=('any')
url="https://github.com/ramonsnir/detoul"
license=('MIT')
groups=()
depends=('git>=2' 'grep>=2.19' 'perl>=5.18' 'sed' 'coreutils')
optdepends=('bash-completion: for auto-completion in bash')
provides=('git-pwd')
source=("https://github.com/ramonsnir/detoul/archive/v$pkgver.tar.gz")
md5sums=('75dbe95906450083ce63461a7f1cfd9a')

package() {
	cd "$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 bash-completion/detoul "${pkgdir}/usr/share/bash-completion/completions/detoul"
	mkdir -p "${pkgdir}/opt/detoul/"
	cp -R . "${pkgdir}/opt/detoul/"
	mkdir -p "${pkgdir}/usr/bin"
	cd "${pkgdir}/usr/bin"
	ln -s /opt/detoul/detoul
	ln -s /opt/detoul/git-pwd
}
