# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='2.1.0'
pkgrel=1
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('d0e8285da4de9456bad9cf8ac0fb7da393136844bae0f77c5e4c32cfffd04a6a')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # rm "$pkgdir/usr/lib/python3.12/site-packages/gitfame/git-fame.1"
    # install -Dm644 "${srcdir}/git-fame/gitfame/git-fame.1" "${pkgdir}/usr/share/man/man1/git-fame.1"
}
