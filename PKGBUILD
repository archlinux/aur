# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin gmail com>

pkgname=python-i3-py
pkgver=0.7.0
_commit=64a19dad345f96d9c014291b7ce202109f4b9a9a
pkgrel=1
pkgdesc="tools for i3 users and developers"
arch=('any')
url='https://github.com/ziberna/i3-py'
license=('GPL-3.0-or-later')
depends=('python' 'i3-wm')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
source=("$pkgname::git+https://github.com/brett/i3-py#commit=$_commit")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 examples/*.py -t "$pkgdir"/usr/share/"$pkgname"/examples
}

# vim: set et sw=4 sts=4 ft=sh:
