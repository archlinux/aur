# Maintainer: Eugene Dvoretsky <radioxoma at gmail com>

pkgname=heval-git
pkgver=v0.0.5.r7.g0aa8c1b
pkgrel=1
pkgdesc="Heval - a human evaluator"
arch=('any')
url="https://github.com/radioxoma/heval"
license=('GPLv3')
groups=()
depends=('python' 'tk')
makedepends=('git' 'python-setuptools')
provides=("heval")
conflicts=("heval")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/radioxoma/heval")
sha256sums=('SKIP')
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$srcdir/$pkgname/heval.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
