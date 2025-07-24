# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='3.1.1'
pkgrel=1
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate')
optdepends=('python-yaml')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('6f1ffc35ec5a46a2726dc05c5017eab87a2fbf9ff12c6ad5f64946d5d2896566')

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
