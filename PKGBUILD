# Maintainer: Kenee Patel  <patelkenee2804 + aur at gmail <.> com>
pkgname=piston-cli-git
_pkgname=piston-cli
pkgver=r71.094d30a
pkgrel=1
pkgdesc="A universal shell supporting 36+ languages, in terminal code editor with syntax highlight, code compiler (36+ languages). It can run code from pastebin links and files too. "
arch=('any')
url="https://github.com/Shivansh-007/piston-cli.git"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
optdepends=()
provides=('piston-cli')
conflicts=('piston-cli')
source=('git'+$url)
sha256sums=('SKIP')

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}
