# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='4.2.0'
pkgrel=1
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate' 'python-shtab')
optdepends=('python-yaml')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('6be47510269ffc9403c5d57e1b760e2dc27a47adb56ac11d8834b6f6a86328ff')

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
