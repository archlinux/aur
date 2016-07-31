# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
pkgname=mvim-git
pkgver=v0.1.0.r0.gee15d51
pkgrel=1
pkgdesc="Rename or move files by editing their names with vim."
arch=(any)
url="https://github.com/bouttier/mvim.git"
license=('APACHE')
depends=('python')
makedepends=('git')
options=(!emptydirs)
source=("$pkgname"::git+"$url"#branch=master)
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
