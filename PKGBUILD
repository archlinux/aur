# Maintainer: Fabrice Mouhartem (Chouhartem) <aur-packages at epheme dot re>
# Contributor: Filipe Laíns (FFY00) <lains at archlinux dot org>
# Contributor: Hyacinthe Cartiaux < hyacinthe dot cartiaux at free dot fr >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>
# Cloned from: https://gitlab.archlinux.org/archlinux/packaging/packages/python-livereload/-/tree/main
# Notice of removal: https://lists.archlinux.org/archives/list/arch-dev-public@lists.archlinux.org/message/V2IQUDSTZQJRF6AWMGRHYRF37VZFRYX6/
# Reason for putting it in AUR: dependency of `aur/kalamine-git`

_name="livereload"
_module="${_name}"

pkgname="python-${_module}"
pkgver=2.7.0
pkgrel=1
pkgdesc="livereload server in python"
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
depends=("python" "python-six" "python-tornado")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('676f50b9300e1582177493cef24f4e2b10a4e385d0de780bf9161dee66e3063420338021464477c8079bffd0e4690a4b0d15c71025ebf1959addbaa6e69fa8bb')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
