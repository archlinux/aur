# Maintainer: Giuseppe Nebbione <giuseppenebbione at gmail dot com>

pkgname=kb-git
pkgver=0.1.3.r100.b6b334f
pkgrel=1
epoch=
pkgdesc="A command line minimalist knowledge base manager"
arch=(any)
url="https://github.com/gnebbia/kb.git"
license=('GPL3')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(kb)
conflicts=(kb)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
   cd "${srcdir}/${pkgname%-git}" 
   printf "0.1.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
